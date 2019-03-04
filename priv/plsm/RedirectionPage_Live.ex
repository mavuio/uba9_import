defmodule DI.RedirectionpageLive do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "RedirectionPage_Live" do
    field :ID, :integer
    field :TargetMwLink, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RedirectionTarget, :RedirectionType, :TargetMwLink)
  end
end
