class PaymentsController < ApplicationController

  before_action :authenticate_usuario!  # el usuario tiene que estar logueado

  def create
    @payment = current_usuario.payments.new(post_params)
    respond_to do | format |
      if @payment.save
        format.html { redirect_to carrito_path}
        format.json { head :no_content}
      else
        redirect_to Post.find(post_params[:post_id]), error: "No se pudo procesar la compra"
        format.json { head :no_content}
      end
    end
  end

  def carrito
    # Obtiene los pagos del usuario con estado 1 (no pagado)
    @payments = current_usuario.payments.where(estado: 1)
  end

  def compras
    # Obtiene los pagos del usuario con estado 2 (pagado)
    @payments = current_usuario.payments.where(estado: 2)
    respond_to do | format |
      if @payments.size == 0
        format.html { redirect_to carrito_path, error: "No tienes ninguna compra pagada"}
        format.json { head :no_content}
      end
    end
  end

  def express
    costo = current_usuario.costo_compra_pendiente

    # express_gateway sale de la configuración en los environments de activemerchant
    response = EXPRESS_GATEWAY.setup_purchase(costo * 100,
         ip: request.remote_ip,
         return_url: "http://localhost:3000/transactions/checkout",
         cancel_return_url: "http://localhost:3000/carrito",
         name: "Checkout de compras en EasyDesign",
         amount: costo*100
    )
    redirect_to EXPRESS_GATEWAY.redirect_url_for(response.token, review: false)
  end

  private

    def post_params
      # post_id es el id del post que está intentando comprar el usuario
      params.require(:payment).permit(:post_id)
    end

end
