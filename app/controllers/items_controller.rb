class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :already_order,except:[:index,:show,:new,:create]
  def index
    @items = Item.all
  end
  def new
    @item = Item.new
  end
  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  def show
    @item = Item.find(params[:id])
    @comment = Comment.new
    @comments = @item.comments.all
  end
  def edit
    @item = Item.find(params[:id])
  end
  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end
  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  def search
    @result = @p.result
  end
  private
  def item_params
    params.require(:item).permit(:item_name,:item_category_id,:item_statue_id,:yamato_id,:cost,:area_id,:days_id,:image,:item_text).merge(user_id: current_user.id)
  end
  def already_order
    @item = Item.find(params[:id])
    if  @item.order != nil
      redirect_to root_path
    end
  end
  def search_item
    @p = Item.where(params[:q])
  end
end
