class Vivienda < ApplicationRecord
  belongs_to :user
  belongs_to :tipo_vivienda
    has_many :viviendas_espacios, dependent: :destroy
  has_many :espacios, through: :viviendas_espacios
end
