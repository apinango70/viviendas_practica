class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Enum de roles
  enum role: {  user: 'user',
                admin: 'admin',
  }, _default: 'user'

  # Validaciones
  validates :username, presence: { message: "Username field cannot be blank" }, uniqueness: { message: "Username is already in use" }

    # Defino una foto al usuario
    has_one_attached :photo

    #Relacion 1:n con viviendas y borrado en cascada
    has_many :viviendas, dependent: :destroy

end
