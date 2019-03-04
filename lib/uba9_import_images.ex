defmodule DI.Images do
  import Ecto.Query
  alias DI.Repo
  alias DI.TxLokalImage
  alias DI.ArticleLive
  alias DI.SitetreeLive
  alias Ecto.Multi
  import MwHelpers

  def import_all_images do
    DI.get_projects()
    |> Enum.flat_map(&get_gallery_pages_for_project_page(&1.page))
    |> Enum.flat_map(&get_images_for_gallerypage/1)
  end

  def get_gallery_pages_for_project_page(nil) do
    []
  end

  def get_gallery_pages_for_project_page(project_page) do
    pages = [%{project_page | title: "default"}]

    pics_page =
      get_sub_nodes(project_page.uid, :query)
      |> Ecto.Query.where(title: "pics")
      |> Ecto.Query.where(hidden: false)
      |> Ecto.Query.select([r], map(r, [:uid, :title, :alias]))
      |> Repo.one()

    sub_pages =
      case pics_page do
        nil ->
          []

        pic_page ->
          get_sub_nodes(pic_page.uid, :query)
          |> Ecto.Query.where(hidden: false)
          |> Ecto.Query.select([r], map(r, [:uid, :title, :alias]))
          |> Repo.all()
      end

    (pages ++ sub_pages)
    |> Enum.map(
      &(Map.put_new(&1, :project, project_page)
        |> Map.put_new(:slug, Slug.slugify(&1.title)))
    )
  end

  def get_sub_nodes(page_id, type \\ :model, fields \\ [:uid, :title]) do
    DI.Pages
    |> where(pid: ^page_id)
    |> where(deleted: false)
    |> DI.return_query(Repo, type, fields)
  end

  def get_images_for_gallerypage(page) do
    base_url = "http://www.design-build.at/uploads/tx_lokal/"

    base_dir = "projects/#{page.project.alias}/#{page.slug}/"

    images =
      from(
        i in TxLokalImage,
        where: i.deleted == 0,
        where: i.pid == ^page.uid,
        order_by: "sorting"
      )
      |> DI.return_query(Repo, :map, [
        :image,
        :sorting,
        :text,
        :text_en,
        :image,
        :title,
        :title_en,
        :copyright
      ])
      |> Enum.map_reduce(10, fn item, index ->
        {
          %{
            url: base_url <> item.image,
            filename:
              base_dir <>
                "img_" <>
                (index |> Integer.to_string() |> String.rjust(3, ?0)) <> "_" <> item.image,
            copyright: item.copyright,
            title: item.title,
            title_en: item.title_en,
            text: item.text,
            text_en: item.text_en
          },
          index + 10
        }
      end)
      |> elem(0)
  end

  def get_galleries_for_project_page(project_page) do
    get_gallery_pages_for_project_page(project_page)
    |> Enum.map(fn g ->
      g
      |> Map.put_new(
        :count,
        g
        |> get_images_for_gallerypage()
        |> Enum.count()
      )
    end)
    |> Enum.filter(&(&1.count > 0))
  end
end
