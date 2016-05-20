class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.text :text

      t.timestamps null: false
    end
  end
end
