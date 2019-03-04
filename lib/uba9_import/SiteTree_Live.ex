defmodule DI.SitetreeLive do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:ID, :id, autogenerate: true}
  schema "SiteTree_Live" do
    field(:LastEdited, :naive_datetime)
    field(:Created, :naive_datetime)
    field(:URLSegment, :string)
    field(:ClassName, :string)
    field(:Title, :string)
    field(:MenuTitle, :string)
    field(:Sort, :integer)
    field(:ReportClass, :string)
    field(:Version, :integer)
    field(:HideOn, :naive_datetime)
    field(:PublishOn, :naive_datetime)
    field(:ArchiveOn, :naive_datetime)
    field(:ParentID, :integer)
    field(:Hidden, :boolean)
    field(:ShowInMenus, :boolean)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(
      params,
      [
        :LastEdited,
        :Created,
        :URLSegment,
        :ClassName,
        :Title,
        :MenuTitle,
        :Sort,
        :ReportClass,
        :Version,
        :HideOn,
        :PublishOn,
        :ArchiveOn,
        :ParentID,
        :Hidden,
        :ShowInMenus
      ]
    )
    |> validate_required([:ParentID, :Title, :ClassName])
  end
end
