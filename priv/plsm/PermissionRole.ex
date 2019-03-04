defmodule DI.Permissionrole do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "PermissionRole" do
    field :ID, :integer
    field :LastEdited, :naive_datetime
    field :Created, :naive_datetime
    field :Title, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :ClassName, :LastEdited, :Created, :Title, :OnlyAdminCanApply)
  end
end
