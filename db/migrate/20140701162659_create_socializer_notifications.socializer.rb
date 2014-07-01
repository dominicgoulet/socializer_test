# This migration comes from socializer (originally 20140128235250)
class CreateSocializerNotifications < ActiveRecord::Migration
  def change
    create_table :socializer_notifications do |t|
      t.integer :activity_id
      t.integer :activity_object_id
      t.boolean :read,          default: false

      t.timestamps
    end
  end
end
