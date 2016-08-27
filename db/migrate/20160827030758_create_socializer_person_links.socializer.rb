# This migration comes from socializer (originally 20140131070232)
# frozen_string_literal: true

class CreateSocializerPersonLinks < ActiveRecord::Migration[4.2]
  def change
    create_table :socializer_person_links do |t|
      t.string   :display_name, null: false
      t.string   :url, null: false
      t.integer  :person_id, null: false

      t.timestamps null: false
    end

    add_index :socializer_person_links, :person_id
    add_foreign_key :socializer_person_links, :socializer_people
  end
end
