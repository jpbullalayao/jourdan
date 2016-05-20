class CreateAnimes < ActiveRecord::Migration
  def change
    create_table :animes do |t|
      t.string :name
      t.integer :status, index: true

      t.timestamps null: false
    end
  end
end
