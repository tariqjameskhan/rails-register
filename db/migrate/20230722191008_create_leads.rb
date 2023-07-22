class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :email_address
      t.string :telephone_number
      t.string :linked_in
      t.string :github
      t.boolean :follow_up
      t.boolean :interview
      t.boolean :offer

      t.timestamps
    end
  end
end
