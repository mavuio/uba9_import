defmodule DI.TxLokalCategory do
  use Ecto.Schema

@primary_key {:uid, :integer, []}
  schema "tx_lokal_category" do
    field :uid, :integer
    field :pid, :integer
    field :tstamp, :integer
    field :crdate, :integer
    field :cruser_id, :integer
    field :sorting, :integer
    field :deleted, :integer
    field :hidden, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :uid, :pid, :tstamp, :crdate, :cruser_id, :sorting, :deleted, :hidden, :title, :title_en)
  end
end
