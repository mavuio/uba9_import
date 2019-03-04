defmodule DI do
  import Ecto.Query
  alias DI.Repo
  alias DI.ArticleLive
  alias DI.SitetreeLive
  alias DI.TxLokalProject
  alias Ecto.Multi
  import MwHelpers

  def get_project_pages(type \\ :model, fields \\ [:uid, :title, :alias]) do
    DI.Pages
    |> where(pid: 12)
    |> where(deleted: false)
    |> return_query(Repo, type, fields)
  end

  def get_project_records(type \\ :model, fields \\ nil) do
    TxLokalProject
    |> where(deleted: false)
    |> where(hidden: false)
    |> order_by(:sorting)
    |> return_query(Repo, type, fields)
  end

  def get_projects() do
    project_pages = get_project_pages(:model)

    get_project_records(:model)
    |> Enum.map(fn rec ->
      rec =
        rec
        |> Map.from_struct()
        |> Map.drop([:__meta__, :crdate, :cruser_id, :deleted, :hiddenm, :pid])

      page =
        project_pages
        |> Enum.find(fn a -> a.alias == rec.alias end)

      case page do
        nil -> rec |> Map.put_new(:page, nil)
        _ -> rec |> Map.put_new(:page, page)
      end
    end)
  end

  def create_spage(data \\ %{}, parent_id \\ 16) do
    data =
      Map.merge(
        %{
          ClassName: "Article",
          Hidden: false,
          Type: "Project",
          ShowInMenus: true,
          ParentID: parent_id
        },
        data
      )

    sitetree = %SitetreeLive{}
    sitetree_changeset = SitetreeLive.changeset(sitetree, data)
    article = %ArticleLive{}
    article_changeset = ArticleLive.changeset(article, data)

    tr =
      Ecto.Multi.new()
      |> Ecto.Multi.insert(:sitetree, sitetree_changeset, returning: [:ID])
      |> Ecto.Multi.run(:article, fn %{sitetree: sitetree} ->
        # Use the inserted team.

        Repo.insert(article_changeset |> Ecto.Changeset.put_change(:ID, sitetree."ID"))
      end)

    Repo.transaction(tr)
  end

  def get_all_spages(type \\ :model, fields \\ [:ID, :Title]) do
    DI.SitetreeLive
    |> where(ParentID: 16)
    |> return_query(Repo, type, fields)
  end

  def delete_all_spages() do
    page_ids = get_all_spages(:value, [:ID])

    res1 =
      DI.SitetreeLive
      |> where([p], p."ID" in ^page_ids)
      |> Repo.delete_all()

    res2 =
      DI.ArticleLive
      |> where([p], p."ID" in ^page_ids)
      |> Repo.delete_all()

    {res1, res2}
  end

  def create_project_spages(limit \\ nil) do
    delete_all_spages()

    get_projects()
    |> pipe_when(limit !== nil, Enum.take(limit))
    |> Enum.map(&create_project_spage/1)
    |> Enum.count()
  end

  def create_project_spage(%{page: oldpage} = project) do
    data = %{
      Title: project.title,
      Title_en: project.title_en,
      URLSegment: project.alias,
      Sort: project.sorting,
      InfoTable_de: project.infotable,
      InfoTable_en: project.infotable_en,
      ShortText_de: project.short_text,
      ShortText_en: project.short_text_en,
      C4Pjson_MainContent:
        oldpage
        |> get_old_pagecontent()
        |> IO.inspect(label: "old pagecontent")
        |> create_new_pagecontent()
    }

    create_spage(data)
  end

  def get_old_pagecontent(nil) do
    %{
      subpages: [],
      galleries: []
    }
  end

  def get_old_pagecontent(%DI.Pages{} = oldrec) do
    %{
      subpages:
        get_sub_pages(oldrec.uid, :model, nil)
        |> Enum.map(fn item ->
          item
          |> Map.put(
            :children,
            get_grouped_page_elements(item.uid)
            |> Enum.map(
              &%{de: get_data_from_page_element(&1.de), en: get_data_from_page_element(&1.en)}
            )
          )
        end),
      galleries: DI.Images.get_galleries_for_project_page(oldrec)
    }
  end

  def get_data_from_page_element(el) do
    el
    |> Map.from_struct()
    |> Map.take([:uid, :header, :CType, :sys_language_uid, :bodytext])
    |> (fn rec -> %{rec | bodytext: fix_bodytext(rec.bodytext)} end).()
  end

  def fix_bodytext(txt) do
    txt
    |> String.split(~r/\R/)
    |> Enum.map(&("<p>" <> fix_text_content(&1) <> "</p>"))
    |> Enum.join("\n")
  end

  def fix_text_content("") do
    "&nbsp;"
  end

  def fix_text_content(txt) do
    txt
  end

  @spec create_new_pagecontent(atom() | %{galleries: any(), subpages: any()}) :: any()
  def create_new_pagecontent(data) do
    elements_from_subpages =
      data.subpages
      |> Enum.map(&create_pagecontent_from_page/1)
      |> Enum.filter(&(&1 !== nil))

    galleries_from_subpages =
      data.galleries
      |> Enum.map(
        &%{
          "CType" => "Article_C4P_Gallery",
          "Title" => &1.title,
          "Path" => "/projects/#{&1.project.alias}/#{&1.slug}/"
        }
      )

    MwHelpers.zip_merge(galleries_from_subpages, elements_from_subpages)
    |> reformat_list_to_object()
    |> IO.inspect(label: "create_new_pagecontent")
  end

  def reformat_list_to_object(items) do
    items

    index = DateTime.utc_now() |> DateTime.to_unix(:second)

    items
    |> Enum.map_reduce(index, fn item, index ->
      {{index |> Integer.to_string(), item}, index + 1}
    end)
    |> elem(0)
    |> Map.new()
  end

  def create_pagecontent_from_page(pagedata) do
    children =
      pagedata.children
      |> Enum.map(&create_content_from_old_content/1)
      |> Enum.filter(&(&1 !== nil))
      |> reformat_list_to_object()

    case children do
      %{} = map when map_size(map) == 0 ->
        nil

      _ ->
        children

        %{
          "CType" => "Article_C4P_Panel",
          "Title" => pagedata.title,
          "_children" => children
        }
    end
  end

  def create_content_from_old_content(oldcontent) do
    case oldcontent.de."CType" do
      n when n in ["textpic", "text"] ->
        %{
          "CType" => "Article_C4P_Text",
          # "Title" => oldcontent.header,
          "Text_en" => oldcontent.en.bodytext,
          "Text_de" => oldcontent.de.bodytext
        }

      _ ->
        nil
    end
  end

  defmacro my_fields(fields, :tuple) do
    afields =
      fields
      |> Enum.map(fn fname ->
        quote do
          {{:., [], [{:c, [], Elixir}, unquote(fname)]}, [], []}
        end
      end)

    quote do
      {:{}, [], unquote(afields)}
    end
  end

  # defmacro my_fields(fields,:map) do

  #   fields
  #   |> Enum.map(fn fname ->
  #     quote do
  #      {{:., [], [{:c, [], Elixir}, unquote(fname)]}, [], []}
  #    end
  #  end
  #  )
  # end

  # defmacro my_fields(fields,:model) do

  #   fields
  #   |> Enum.map(fn fname ->
  #     quote do
  #      {{:., [], [{:c, [], Elixir}, unquote(fname)]}, [], []}
  #    end
  #  end
  #  )
  # end

  def return_query(query, repo, type \\ :model, fields) do
    res =
      case type do
        :model ->
          case fields do
            nil -> query
            _ -> query |> select([r], struct(r, ^fields))
          end

        :map ->
          query |> select([r], map(r, ^fields))

        :tuple ->
          query |> select([r], map(r, ^fields))

        :value ->
          query |> select([r], map(r, ^fields))

        :query ->
          query
      end
      |> Repo.all()

    case type do
      :query -> query
      :tuple -> res |> Enum.map(&(Map.values(&1) |> List.to_tuple()))
      :value -> res |> Enum.map(&(Map.values(&1) |> Enum.at(0)))
      _ -> res
    end
  end

  def get_sub_pages(page_id, type \\ :model, fields \\ [:uid, :title]) do
    DI.Pages
    |> where(pid: ^page_id)
    |> where(deleted: false)
    |> where(hidden: false)
    |> where([p], fragment("BINARY ?", p.title) == fragment("upper(?)", p.title))
    |> return_query(Repo, type, fields)
  end

  def get_page_elements(
        page_id,
        type \\ :model,
        fields \\ nil
      ) do
    DI.TtContent
    # |> select([c],{c.uid,c.header,c.ctype, c.bodytext, c.sys_language_uid})
    # |> select([c],my_fields([:uid,:header,:ctype, :bodytext, :sys_language_uid],:tuple))
    # |>select([c], {c.uid(), c.pid(), c.bodytext()})
    |> where(pid: ^page_id)
    |> where([c], c."CType" not in ["yy_pkg_pi1"])
    |> where(deleted: 0)
    |> order_by(:sorting)
    |> return_query(Repo, type, fields)
  end

  def get_grouped_page_elements(page_id) do
    en_items =
      get_page_elements(page_id, :model)
      |> Enum.filter(&(&1.sys_language_uid == 1))

    de_items =
      get_page_elements(page_id, :model)
      |> Enum.filter(&(&1.sys_language_uid == 0))

    if(Enum.count(en_items) > Enum.count(de_items)) do
      raise MwError, {"#{page_id} hat mehr en  als de elemente"}
    end

    en_items =
      en_items ++
        if(Enum.count(en_items) < Enum.count(de_items)) do
          diff = Enum.count(de_items) - Enum.count(en_items)

          Range.new(1, diff)
          |> Enum.map_reduce(de_items, fn _n, [de_item | de_items] ->
            {de_item, de_items}
          end)
          |> elem(0)
          |> IO.inspect(label: "mwuits-debug 2018-10-17_17:19 ")
        else
          []
        end

    de_items
    |> Enum.map_reduce(en_items, fn de_item, [en_item | rest_en_items] ->
      {%{de: de_item, en: en_item}, rest_en_items}
    end)
    |> elem(0)
  end
end
