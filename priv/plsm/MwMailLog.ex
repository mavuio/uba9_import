defmodule DI.Mwmaillog do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwMailLog" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :From, :text
    field :To, :text
    field :Subject, :text
    field :Headers, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :From, :To, :Subject, :Headers, :Body)
  end
end
