class CreateTaskProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :task_profiles do |t|
      t.bigint :oid
      t.text :name
      t.text :description
      t.text :xm_descriptor
      t.boolean :matchable
      t.boolean :profileable
      t.bigint :es_score
      t.bigint :default_cost_guide_id
      t.text :keywords
      t.text :text_messaging_name
      t.text :rollover_long_desc
      t.text :rollover_short_desc
      t.text :sector_id
      t.text :meta_description
      t.text :html_title
      t.text :content_description
      t.bigint :pwc_id
      t.bigint :accept_goal
      t.boolean :multi_zip
      t.bigint :pre_match_type_id
      t.bigint :bridge_oid
      t.text :bridge_text
      t.text :bridge_link_text
      t.bigint :bridge_link_id
      t.text :bridge_active
      t.text :xm_name
      t.bigint :redirect_to_oid
      t.text :sp_display_name
      t.text :xm_header_descriptor
      t.text :url_name
      t.bigint :consideration_id
      t.text :search_keywords
      t.bigint :emc_category_oid
      t.bigint :primary_question_set_id
      t.boolean :location_specific
      t.boolean :commercial
      t.boolean :view_first_parent_task

      t.timestamps
    end
  end
end
