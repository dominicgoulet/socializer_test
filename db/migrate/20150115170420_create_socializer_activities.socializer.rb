# This migration comes from socializer (originally 20110805090617)
class CreateSocializerActivities < ActiveRecord::Migration
  def change
    create_table :socializer_activities do |t|
      t.integer  :actor_id,           null: false
      t.integer  :activity_object_id, null: false
      t.integer  :target_id
      t.integer  :verb_id,            null: false

      t.timestamps null: false
    end

    add_index :socializer_activities, :actor_id
    add_index :socializer_activities, :activity_object_id
    add_index :socializer_activities, :target_id
    add_index :socializer_activities, :verb_id
  end
end
