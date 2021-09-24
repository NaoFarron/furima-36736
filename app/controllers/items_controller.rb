class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :item_Status_id, :delivery_fee_id, :prefecture_id, :estimated_shipping_date_id, :price,  :image).merge(user_id: current_user.id)
  end
end
