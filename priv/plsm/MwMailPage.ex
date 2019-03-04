defmodule DI.Mwmailpage do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwMailPage" do
    field :ID, :integer
    field :Subject, :text
    field :SenderEmail, :text
    field :SenderName, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :Subject, :SenderEmail, :SenderName)
  end
end
