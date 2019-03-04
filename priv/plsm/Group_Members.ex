defmodule DI.GroupMembers do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "Group_Members" do
    field :ID, :integer
    field :GroupID, :integer
    field :MemberID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :GroupID, :MemberID)
  end
end
