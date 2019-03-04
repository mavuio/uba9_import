defmodule DI.SitetreeLive do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "SiteTree_Live" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :URLSegment, :text
    field :Title, :text
    field :MenuTitle, :text
    field :Sort, :integer
    field :ReportClass, :text
    field :Version, :integer
    field :HideOn, :naive_datetime
    field :PublishOn, :naive_datetime
    field :ArchiveOn, :naive_datetime
    field :ParentID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :URLSegment, :Title, :MenuTitle, :Content, :MetaDescription, :ExtraMeta, :ShowInMenus, :ShowInSearch, :Sort, :HasBrokenFile, :HasBrokenLink, :ReportClass, :Version, :CanViewType, :CanEditType, :Hidden, :HideOn, :PublishOn, :Archived, :ArchiveOn, :ParentID)
  end
end
