class CreateViviendas < ActiveRecord::Migration[7.0]
  def change
    create_table :viviendas do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :superficie
      t.string :direccion

      t.timestamps
    end
  end
end
