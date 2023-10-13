class Espacio < ApplicationRecord
  has_many :viviendas_espacios
  has_many :viviendas, through: :viviendas_espacios
end
