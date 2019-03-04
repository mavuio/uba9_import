defmodule DI.TxLokalProject do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:uid, :integer, []}
  schema "tx_lokal_project" do
    field(:pid, :integer)
    field(:tstamp, :integer)
    field(:crdate, :integer)
    field(:cruser_id, :integer)
    field(:sorting, :integer)
    field(:deleted, :boolean)
    field(:hidden, :boolean)
    field(:date, :integer)
    field(:alias, :string)

    field(:title, :string)
    field(:title_en, :string)
    field(:short_text, :string)
    field(:short_text_en, :string)
    field(:infotable, :string)
    field(:infotable_en, :string)
    field(:datum, :integer)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(
      params,
      [
        :uid,
        :pid,
        :tstamp,
        :crdate,
        :cruser_id,
        :sorting,
        :deleted,
        :hidden,
        :title,
        :title_en,
        :date,
        :alias,
        :short_text,
        :short_text_en,
        :categories,
        :image,
        :imageX,
        :infotable,
        :infotable_en,
        :datum
      ]
    )
  end
end
