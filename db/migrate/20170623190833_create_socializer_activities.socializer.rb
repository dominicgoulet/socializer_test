# This migration comes from socializer (originally 20110805090617)
# frozen_string_literal: true

class CreateSocializerActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :socializer_activities do |t|
      t.integer :actor_id,           null: false
      t.integer :activity_object_id, null: false
      t.integer :verb_id,            null: false
      t.integer :target_id

      t.timestamps
    end

    add_index :socializer_activities, :actor_id
    add_index :socializer_activities, :activity_object_id
    add_index :socializer_activities, :target_id
    add_index :socializer_activities, :verb_id
  end
end
