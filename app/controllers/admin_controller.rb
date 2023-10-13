class AdminController < ApplicationController
  before_action :set_user, only: [ :update]
  before_action :authenticate_user!
  before_action :authorize_admin!

  def edit_user
    @users = User.order(:id)
  end

  def create
    @user = User.new(user_params)
    puts "Received parameters: #{params.inspect}"

    if @user.save
      redirect_to admin_create_user_path, notice: 'User was successfully created.'
    else
      #Muestro los mensajes personalizados de error definidos en las validaciones
      error_messages = @user.errors.full_messages.join(', ')
      redirect_to admin_create_user_path, alert: "User was not created. #{error_messages}"
    end
  end

  def new
    @user = User.new
  end

  def update
    if @user.update(user_params)
      redirect_to admin_edit_user_path, notice: 'User was successfully updated.'
    else
      redirect_to admin_edit_user_path, alert: 'User was not updated.'
    end
  end

  private

  def authorize_admin!
    redirect_to root_path, alert: 'Access Denied' unless current_user.admin?
  end

  # Método para pasar parámetros anidados bajo un hash con la clave :user en la solicitud por seguridad
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :role, :username)
  end

  def set_user
    @user = User.find(params[:id])
  end

end
