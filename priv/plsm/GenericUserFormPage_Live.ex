defmodule DI.GenericuserformpageLive do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "GenericUserFormPage_Live" do
    field :ID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :C4Pjson_FormContent, :SubmitContent)
  end
end
