class TransactionsController < ApplicationController

  before_action :authenticate_usuario! # Requiere que el usuario está autenticado

  def checkout
    @transaction = current_usuario.transactions.new(payer_id: strong_params[:PayerID],
                                token: strong_params[:token])
    @transaction.ip_address = request.remote_ip
    @transaction.save
    respond_to | format |  do
      if @transaction.pagar?
        format.html { redirect_to "/", notice: "Gracias por tu compra"}
      else
        format.html { redirect_to carrito_path }
      end
    end

  end

  private

    def strong_params
      params.permit(:token, :PayerID)
    end
end
