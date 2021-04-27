class OrdersController < ApplicationController
  before_action :move_to_index
  before_action :item_user
  def index
    @item = Item.where(id:params[:item_id])
    @orderadress = OrderAdress.new
  end
  def create
    @item = Item.find(params[:item_id])
    @orderadress = OrderAdress.new(order_adress_params)
    if @orderadress.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"] 
      Payjp::Charge.create(
        amount: order_adress_params[:cost],
        card: order_adress_params[:token],
        currency: 'jpy'
      )
      @orderadress.save
      return redirect_to root_path
    else
      render item_path(@item.id)
    end
  end
  private
  def order_adress_params
    params.permit(:phone,:banti,:sikutyouson,:building,:yubin,:area).merge(token:params[:token],item_id:@item.id,cost:@item.cost,user_id:current_user.id)
  end
  def move_to_index
    @item = Item.find(params[:item_id])
    if  @item.order != nil
      redirect_to root_path
    end
  end
  def item_user
    if @item.user_id == current_user.id
      redirect_to root_path
    end
  end
end