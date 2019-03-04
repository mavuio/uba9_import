defmodule DI.ArticleVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "Article_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer
    field :PictureID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :C4Pjson_MainContent, :PictureID)
  end
end
