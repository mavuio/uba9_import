defmodule DI.Permissionrolecode do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "PermissionRoleCode" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Code, :text
    field :RoleID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Code, :RoleID)
  end
end
