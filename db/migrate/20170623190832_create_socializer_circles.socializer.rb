# This migration comes from socializer (originally 20110805085417)
# frozen_string_literal: true

class CreateSocializerCircles < ActiveRecord::Migration[5.1]
  def change
    create_table :socializer_circles do |t|
      t.integer  :author_id,    null: false
      t.string   :display_name, null: false
      t.text     :content

      t.timestamps
    end

    add_index :socializer_circles, :author_id
    add_index :socializer_circles, %i[display_name author_id], unique: true
  end
end
