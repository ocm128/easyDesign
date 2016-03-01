class UsuarioController < ApplicationController

  def show
    @usuario = Usuario.find(params[:id])
  end

  def follow
    respond_to do | format |
      if current_usuario.follow!(post_params[:friend_id]) # follow! es el método del modelo usuario
        format.json {head :no_content}
      else
        format.json {render json: post_params }
      end
    end
  end

  private
    def post_params
      params.require(:usuario).permit(:friend_id)
    end

end
