defmodule DI.Memberpassword do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MemberPassword" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Password, :text
    field :Salt, :text
    field :PasswordEncryption, :text
    field :MemberID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Password, :Salt, :PasswordEncryption, :MemberID)
  end
end
