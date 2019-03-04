defmodule DI.Redirectionpage do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "RedirectionPage" do
    field :ID, :integer
    field :TargetMwLink, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RedirectionTarget, :RedirectionType, :TargetMwLink)
  end
end
