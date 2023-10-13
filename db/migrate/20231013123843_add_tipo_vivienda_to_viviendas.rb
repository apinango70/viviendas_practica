class AddTipoViviendaToViviendas < ActiveRecord::Migration[7.0]
  def change
    add_reference :viviendas, :tipo_vivienda, null: false, foreign_key: true
  end
end
