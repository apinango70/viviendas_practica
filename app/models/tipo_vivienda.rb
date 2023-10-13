class TipoVivienda < ApplicationRecord
  has_many :viviendas, dependent: :destroy
end
