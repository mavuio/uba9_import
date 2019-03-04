defmodule DI.PagesLanguageOverlay do
  use Ecto.Schema

@primary_key {:uid, :integer, []}
  schema "pages_language_overlay" do
    field :uid, :integer
    field :pid, :integer
    field :t3ver_oid, :integer
    field :t3ver_id, :integer
    field :t3ver_wsid, :integer
    field :t3ver_label, :text
    field :t3ver_state, :integer
    field :t3ver_stage, :integer
    field :t3ver_count, :integer
    field :t3ver_tstamp, :integer
    field :t3_origuid, :integer
    field :tstamp, :integer
    field :crdate, :integer
    field :cruser_id, :integer
    field :sys_language_uid, :integer
    field :title, :text
    field :hidden, :integer
    field :starttime, :integer
    field :endtime, :integer
    field :deleted, :integer
    field :subtitle, :text
    field :nav_title, :text
    field :keywords, :string
    field :description, :string
    field :abstract, :string
    field :author, :text
    field :author_email, :text
    field :tx_impexp_origuid, :integer
    field :doktype, :integer
    field :url, :text
    field :urltype, :integer
    field :shortcut, :integer
    field :shortcut_mode, :integer

  end
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, :uid, :pid, :t3ver_oid, :t3ver_id, :t3ver_wsid, :t3ver_label, :t3ver_state, :t3ver_stage, :t3ver_count, :t3ver_tstamp, :t3_origuid, :tstamp, :crdate, :cruser_id, :sys_language_uid, :title, :hidden, :starttime, :endtime, :deleted, :subtitle, :nav_title, :media, :keywords, :description, :abstract, :author, :author_email, :tx_impexp_origuid, :l18n_diffsource, :doktype, :url, :urltype, :shortcut, :shortcut_mode)
  end
end
