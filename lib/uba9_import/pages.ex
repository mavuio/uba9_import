defmodule DI.Pages do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:uid, :integer, []}
  schema "pages" do
    # field :uid, :integer
    field(:pid, :integer)
    field(:t3ver_oid, :integer)
    field(:t3ver_id, :integer)
    field(:t3ver_wsid, :integer)
    field(:t3ver_label, :string)
    field(:t3ver_state, :integer)
    field(:t3ver_stage, :integer)
    field(:t3ver_count, :integer)
    field(:t3ver_tstamp, :integer)
    field(:t3ver_swapmode, :integer)
    field(:t3_origuid, :integer)
    field(:tstamp, :integer)
    field(:sorting, :integer)
    field(:perms_userid, :integer)
    field(:perms_groupid, :integer)
    field(:perms_user, :integer)
    field(:perms_group, :integer)
    field(:perms_everybody, :integer)
    field(:editlock, :integer)
    field(:crdate, :integer)
    field(:cruser_id, :integer)
    field(:title, :string)
    field(:doktype, :integer)
    field(:TSconfig, :string)
    field(:storage_pid, :integer)
    field(:is_siteroot, :integer)
    field(:php_tree_stop, :integer)
    field(:tx_impexp_origuid, :integer)
    field(:url, :string)
    field(:hidden, :boolean)
    field(:starttime, :integer)
    field(:endtime, :integer)
    field(:urltype, :integer)
    field(:shortcut, :integer)
    field(:shortcut_mode, :integer)
    field(:no_cache, :integer)
    field(:fe_group, :string)
    field(:subtitle, :string)
    field(:layout, :integer)
    field(:target, :string)
    field(:media, :string)
    field(:lastUpdated, :integer)
    field(:keywords, :string)
    field(:cache_timeout, :integer)
    field(:newUntil, :integer)
    field(:description, :string)
    field(:no_search, :integer)
    field(:SYS_LASTCHANGED, :integer)
    field(:abstract, :string)
    field(:module, :string)
    field(:deleted, :boolean)
    field(:extendToSubpages, :integer)
    field(:author, :string)
    field(:author_email, :string)
    field(:nav_title, :string)
    field(:nav_hide, :integer)
    field(:content_from_pid, :integer)
    field(:mount_pid, :integer)
    field(:mount_pid_ol, :integer)
    field(:alias, :string)
    field(:l18n_cfg, :integer)
    field(:fe_login_mode, :integer)
    field(:t3ver_move_id, :integer)
    field(:url_scheme, :integer)
    field(:backend_layout, :integer)
    field(:backend_layout_next_level, :integer)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :uid,
      :pid,
      :t3ver_oid,
      :t3ver_id,
      :t3ver_wsid,
      :t3ver_label,
      :t3ver_state,
      :t3ver_stage,
      :t3ver_count,
      :t3ver_tstamp,
      :t3ver_swapmode,
      :t3_origuid,
      :tstamp,
      :sorting,
      :deleted,
      :perms_userid,
      :perms_groupid,
      :perms_user,
      :perms_group,
      :perms_everybody,
      :editlock,
      :crdate,
      :cruser_id,
      :title,
      :doktype,
      :TSconfig,
      :storage_pid,
      :is_siteroot,
      :php_tree_stop,
      :tx_impexp_origuid,
      :url,
      :hidden,
      :starttime,
      :endtime,
      :urltype,
      :shortcut,
      :shortcut_mode,
      :no_cache,
      :fe_group,
      :subtitle,
      :layout,
      :target,
      :media,
      :lastUpdated,
      :keywords,
      :cache_timeout,
      :newUntil,
      :description,
      :no_search,
      :SYS_LASTCHANGED,
      :abstract,
      :module,
      :extendToSubpages,
      :author,
      :author_email,
      :nav_title,
      :nav_hide,
      :content_from_pid,
      :mount_pid,
      :mount_pid_ol,
      :alias,
      :l18n_cfg,
      :fe_login_mode,
      :t3ver_move_id,
      :url_scheme,
      :backend_layout,
      :backend_layout_next_level
    ])
  end
end
