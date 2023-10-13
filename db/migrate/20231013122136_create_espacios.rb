class CreateEspacios < ActiveRecord::Migration[7.0]
  def change
    create_table :espacios do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
