# This migration comes from socializer (originally 20110804192211)
class CreateSocializerAuthentications < ActiveRecord::Migration
  def change
    create_table :socializer_authentications do |t|
      t.integer  :person_id
      t.string   :provider
      t.string   :uid
      t.string   :image_url

      t.timestamps null: false
    end
  end
end
