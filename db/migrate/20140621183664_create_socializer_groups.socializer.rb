# This migration comes from socializer (originally 20110805121454)
class CreateSocializerGroups < ActiveRecord::Migration
  def change
    create_table :socializer_groups do |t|
      t.integer  :author_id, null: false
      t.string   :name,      null: false
      t.integer  :privacy,   null: false

      t.string   :tagline
      t.text     :about
      t.string   :location

      t.timestamps
    end

    add_index :socializer_groups, :author_id
    add_index :socializer_groups, [:name, :author_id], unique: true
    add_index :socializer_groups, :privacy
  end
end
