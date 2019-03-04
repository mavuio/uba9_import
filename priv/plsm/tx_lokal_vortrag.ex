defmodule DI.TxLokalVortrag do
  use Ecto.Schema

@primary_key {:uid, :integer, []}
  schema "tx_lokal_vortrag" do
    field :uid, :integer
    field :pid, :integer
    field :tstamp, :integer
    field :crdate, :integer
    field :cruser_id, :integer
    field :sorting, :integer
    field :deleted, :integer
    field :hidden, :integer
    field :text, :string
    field :text_en, :string
    field :date, :integer
    field :type, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :uid, :pid, :tstamp, :crdate, :cruser_id, :sorting, :deleted, :hidden, :image, :title, :title_en, :text, :text_en, :date, :source, :type)
  end
end
