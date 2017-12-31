# This migration comes from socializer (originally 20130528143831)
# frozen_string_literal: true

class CreateSocializerActivityFields < ActiveRecord::Migration[5.1]
  def change
    create_table :socializer_activity_fields do |t|
      t.text :content, null: false
      t.references :activity, null: false

      t.timestamps
    end

    add_foreign_key :socializer_activity_fields, :socializer_activities,
                    column: :activity_id,
                    primary_key: "id",
                    on_delete: :cascade
  end
end
