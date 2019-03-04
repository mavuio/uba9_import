defmodule DI.ArticleLive do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:ID, :id, autogenerate: true}
  schema "Article_Live" do
    field(:PictureID, :integer)
    field(:C4Pjson_MainContent, :map)
    field(:InfoTable_de, :string)
    field(:InfoTable_en, :string)
    field(:ShortText_de, :string)
    field(:ShortText_en, :string)
    field(:Title_en, :string)
    field(:Type, :string)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :ID,
      :C4Pjson_MainContent,
      :PictureID,
      :InfoTable_de,
      :InfoTable_en,
      :Type,
      :ShortText_de,
      :ShortText_en,
      :Title_en
    ])
  end
end
