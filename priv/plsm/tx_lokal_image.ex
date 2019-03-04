defmodule DI.TxLokalImage do
  use Ecto.Schema
  import Ecto.Changeset
  @primary_key {:uid, :id, autogenerate: true}

  schema "tx_lokal_image" do
    field(:pid, :integer)
    field(:tstamp, :integer)
    field(:crdate, :integer)
    field(:cruser_id, :integer)
    field(:sorting, :integer)
    field(:deleted, :integer)
    field(:hidden, :integer)
    field(:text, :string)
    field(:text_en, :string)
    field(:title, :string)
    field(:title_en, :string)
    field(:copyright, :string)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :uid,
      :pid,
      :tstamp,
      :crdate,
      :cruser_id,
      :sorting,
      :deleted,
      :hidden,
      :image,
      :title,
      :title_en,
      :text,
      :text_en,
      :copyright
    ])
  end
end
