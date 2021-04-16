class OrdersController < ApplicationController
  before_action :move_to_index
  def index
    @item = Item.where(id:params[:item_id])
    @orderadress = OrderAdress.new
  end
  def create
    @item = Item.find(params[:item_id])
    
    @orderadress = OrderAdress.new(order_adress_params)
   
    if @orderadress.valid?
      Payjp.api_key = "sk_test_42534e3971dac418d090f465"
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
end