defmodule DI.TxImpexpPresets do
  use Ecto.Schema

@primary_key {:uid, :integer, []}
  schema "tx_impexp_presets" do
    field :uid, :integer
    field :user_uid, :integer
    field :title, :text
    field :public, :integer
    field :item_uid, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :uid, :user_uid, :title, :public, :item_uid, :preset_data)
  end
end
