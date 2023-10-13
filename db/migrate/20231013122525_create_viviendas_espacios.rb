class CreateViviendasEspacios < ActiveRecord::Migration[7.0]
  def change
    create_table :viviendas_espacios do |t|
      t.references :vivienda, null: false, foreign_key: true
      t.references :espacio, null: false, foreign_key: true

      t.timestamps
    end
  end
end
