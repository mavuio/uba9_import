defmodule DI.SitetreeVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "SiteTree_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer
    field :AuthorID, :integer
    field :PublisherID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :URLSegment, :text
    field :Title, :text
    field :MenuTitle, :text
    field :Sort, :integer
    field :ReportClass, :text
    field :HideOn, :naive_datetime
    field :PublishOn, :naive_datetime
    field :ArchiveOn, :naive_datetime
    field :ParentID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :WasPublished, :AuthorID, :PublisherID, :ClassName, :LastEdited, :Created, :URLSegment, :Title, :MenuTitle, :Content, :MetaDescription, :ExtraMeta, :ShowInMenus, :ShowInSearch, :Sort, :HasBrokenFile, :HasBrokenLink, :ReportClass, :CanViewType, :CanEditType, :Hidden, :HideOn, :PublishOn, :Archived, :ArchiveOn, :ParentID)
  end
end
