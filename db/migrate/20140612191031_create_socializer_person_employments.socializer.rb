# This migration comes from socializer (originally 20140131065531)
class CreateSocializerPersonEmployments < ActiveRecord::Migration
  def change
    create_table :socializer_person_employments do |t|
      t.integer  :person_id, null: false
      # TODO: change employer_name to name
      t.string   :employer_name
      # TODO: change job_title to title
      t.string   :job_title
      t.date     :started_on
      t.date     :ended_on
      t.boolean  :current
      # TODO: change job_description to description
      t.text     :job_description

      t.timestamps
    end
  end
end
