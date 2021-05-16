class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to action: :index
    end
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_info)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private
  def item_info
    params.require(:item).permit(:name, :item_explain, :category_id, :status_id, :fee_id, :prefecture_id, :days_id, :price, :image).merge(user_id: current_user.id)
  end
end