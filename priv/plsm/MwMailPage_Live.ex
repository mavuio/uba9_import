defmodule DI.MwmailpageLive do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwMailPage_Live" do
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
