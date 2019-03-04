defmodule DI.TtContent do
  use Ecto.Schema

  @primary_key {:uid, :integer, []}
  schema "tt_content" do
    field(:uid, :integer)
    field(:pid, :integer)
    field(:t3ver_oid, :integer)
    field(:t3ver_id, :integer)
    field(:t3ver_wsid, :integer)
    field(:t3ver_label, :string)
    field(:t3ver_state, :integer)
    field(:t3ver_stage, :integer)
    field(:t3ver_count, :integer)
    field(:t3ver_tstamp, :integer)
    field(:t3_origuid, :integer)
    field(:tstamp, :integer)
    field(:hidden, :integer)
    field(:sorting, :integer)
    field(:cType, :string)
    field(:header, :string)
    field(:header_position, :string)
    field(:image, :string)
    field(:imageorient, :integer)
    field(:imagecaption, :string)
    field(:imagecols, :integer)
    field(:imageborder, :integer)
    field(:media, :string)
    field(:layout, :integer)
    field(:deleted, :integer)
    field(:cols, :integer)
    field(:records, :string)
    field(:starttime, :integer)
    field(:endtime, :integer)
    field(:colPos, :integer)
    field(:subheader, :string)
    field(:fe_group, :string)
    field(:header_link, :string)
    field(:imagecaption_position, :string)
    field(:image_link, :string)
    field(:image_zoom, :integer)
    field(:image_noRows, :integer)
    field(:image_effects, :integer)
    field(:image_compression, :integer)
    field(:altText, :string)
    field(:titleText, :string)
    field(:longdescURL, :string)
    field(:header_layout, :string)
    field(:string_align, :string)
    field(:string_face, :integer)
    field(:string_size, :integer)
    field(:string_color, :integer)
    field(:string_properties, :integer)
    field(:menu_type, :string)
    field(:list_type, :string)
    field(:table_border, :integer)
    field(:table_cellspacing, :integer)
    field(:table_cellpadding, :integer)
    field(:table_bgColor, :integer)
    field(:select_key, :string)
    field(:sectionIndex, :integer)
    field(:linkToTop, :integer)
    field(:filelink_size, :integer)
    field(:section_frame, :integer)
    field(:date, :integer)
    field(:splash_layout, :string)
    field(:image_frames, :integer)
    field(:recursive, :integer)
    field(:rte_enabled, :integer)
    field(:sys_language_uid, :integer)
    field(:tx_impexp_origuid, :integer)
    field(:l18n_parent, :integer)
    field(:tx_yypkg_subfilename, :string)
    field(:t3ver_move_id, :integer)
    field(:crdate, :integer)
    field(:cruser_id, :integer)
    field(:tx_yypkg_config, :string)
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(
      params,
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
      :t3_origuid,
      :tstamp,
      :hidden,
      :sorting,
      :cType,
      :header,
      :header_position,
      :bodytext,
      :image,
      :imagewidth,
      :imageorient,
      :imagecaption,
      :imagecols,
      :imageborder,
      :media,
      :layout,
      :deleted,
      :cols,
      :records,
      :pages,
      :starttime,
      :endtime,
      :colPos,
      :subheader,
      :spaceBefore,
      :spaceAfter,
      :fe_group,
      :header_link,
      :imagecaption_position,
      :image_link,
      :image_zoom,
      :image_noRows,
      :image_effects,
      :image_compression,
      :altText,
      :titleText,
      :longdescURL,
      :header_layout,
      :string_align,
      :string_face,
      :string_size,
      :string_color,
      :string_properties,
      :menu_type,
      :list_type,
      :table_border,
      :table_cellspacing,
      :table_cellpadding,
      :table_bgColor,
      :select_key,
      :sectionIndex,
      :linkToTop,
      :filelink_size,
      :section_frame,
      :date,
      :splash_layout,
      :multimedia,
      :image_frames,
      :recursive,
      :imageheight,
      :rte_enabled,
      :sys_language_uid,
      :tx_impexp_origuid,
      :pi_flexform,
      :l18n_parent,
      :l18n_diffsource,
      :tx_yypkg_subfilename,
      :t3ver_move_id,
      :crdate,
      :cruser_id,
      :tx_yypkg_config
    )
  end
end
