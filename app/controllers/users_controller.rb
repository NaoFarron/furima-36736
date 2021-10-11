class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :update]
  
  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = CardRegistration.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得

    redirect_to new_card_registration_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end

  def update
    if current_user.update(user_params) 
      redirect_to root_path
    else
      redirect_to action: "show" 
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :birthday) 
  end

end