defmodule DI.Tag do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "Tag" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :TagKey, :text
    field :Type, :text
    field :Title, :text
    field :Frequency, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :TagKey, :Type, :Title, :Frequency)
  end
end
