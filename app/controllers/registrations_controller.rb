class RegistrationsController < Devise::RegistrationsController

  # Esta clase sobreescribe el RegistrationsController de Devise

  def new
    super
    # flash[:notice] = session[:omniauth_errors]
    # @fb_data = session[:facebook_data]
    # session.delete(:omniauth_errors)
  end

  def create
    super
    #session.delete(:facebook_data)
  end

  def update
    super
  end

  private
    def sign_up_params
      allow = [:email, :username, :password, :password_confirmation]

      # resource_name hace referencia al recurso requerido, en este caso el modelo Usuario
      params.require(resource_name).permit(allow)
   end

end