class OrderAdress
  include ActiveModel::Model
  attr_accessor :sikutyouson,:banti,:yubin,:building,:area,:phone,:item_id,:item,:cost,:token,:user_id
  def save
    @order = Order.create(cost:cost,item_id:item_id,user_id:user_id)
    @adress = Adress.create(sikutyouson:sikutyouson,banti:banti,yubin:yubin,building:building,area:area,phone:phone,order_id:@order.id)
  end
  validates :yubin,format:{with:/\A[0-9]{3}-[0-9]{4}\z/}

end