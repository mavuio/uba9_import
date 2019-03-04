defmodule DI.GenericuserformpageVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "GenericUserFormPage_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :C4Pjson_FormContent, :SubmitContent)
  end
end
