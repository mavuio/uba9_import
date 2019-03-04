defmodule DI.Loginattempt do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "LoginAttempt" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Email, :text
    field :EmailHashed, :text
    field :IP, :text
    field :MemberID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Email, :EmailHashed, :Status, :IP, :MemberID)
  end
end
