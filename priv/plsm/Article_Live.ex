defmodule DI.ArticleLive do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "Article_Live" do
    field :ID, :integer
    field :PictureID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :C4Pjson_MainContent, :PictureID)
  end
end
