class OrdersController < ApplicationController
  include Devise::Controllers::Helpers

  def order_params
    params.require(:order).permit(:id_product, :id_user, :description, :status, :order_date)
  end


  def index
    @orders = Order.all
  end


  def show
    @orders = Order.where(user_id: current_user.id)
  end


  def create
    @order = Order.new(order_params)
      @order.user_id = current_user.id # Asignar el id del usuario actual

      if @order.save
        render json: {message: "La orden ha sido recibida"}
      else
        render json: @order.errors, status: :unprocessable_entity
      end
  end
  """
update prox sprint
"""
  def update
    @order = Order.find(params[:id])

      if @order.update(order_params)
        render json: {message: "El estado de la orden se actualizo"}
      else
        render json: @order.errors, status: :unprocessable_entity
      end
  end


  def destroy
    @order = Order.find(params[:id])

      if @order.destroy
        render json: {message: "La orden se eliminó correctamente."}
      else
        render json: @order.errors, status: :unprocessable_entity
      end
  end

end

