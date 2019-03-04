defmodule DI.FileEditorgroups do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "File_EditorGroups" do
    field :ID, :integer
    field :FileID, :integer
    field :GroupID, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :FileID, :GroupID)
  end
end
