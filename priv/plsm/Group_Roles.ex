defmodule DI.GroupRoles do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "Group_Roles" do
    field :ID, :integer
    field :GroupID, :integer
    field :PermissionRoleID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :GroupID, :PermissionRoleID)
  end
end
