class BuysController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new
    if @item.buy.present?
      redirect_to root_path
    elsif current_user == @item.user
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_delivery = BuyDelivery.new(buy_params)
    if @buy_delivery.valid?
      pay_item
      @buy_delivery.save
      redirect_to root_path
    else
      render :index
    end
   
  end

  private

  def buy_params
    params.require(:buy_delivery).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
  
  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
       amount: @item[:price],  
       card: buy_params[:token],    
       currency: 'jpy'                 
     )
  end

end
