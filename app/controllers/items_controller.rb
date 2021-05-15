class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_info)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def item_info
    params.require(:item).permit(:name, :item_explain, :category_id, :status_id, :fee_id, :prefecture_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end
end