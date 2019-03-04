defmodule DI.Changeset do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "ChangeSet" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Name, :text
    field :PublishDate, :naive_datetime
    field :LastSynced, :naive_datetime
    field :OwnerID, :integer
    field :PublisherID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Name, :State, :IsInferred, :Description, :PublishDate, :LastSynced, :OwnerID, :PublisherID)
  end
end
