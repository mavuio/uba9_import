defmodule DI.MwmailpageVersions do
  use Ecto.Schema

@primary_key {:ID, :integer, []}
  schema "MwMailPage_Versions" do
    field :ID, :integer
    field :RecordID, :integer
    field :Version, :integer
    field :Subject, :text
    field :SenderEmail, :text
    field :SenderName, :text

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :ID, :RecordID, :Version, :Subject, :SenderEmail, :SenderName)
  end
end
