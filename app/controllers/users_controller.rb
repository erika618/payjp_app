class UsersController < ApplicationController
  # ログインしているユーザーに紐づくカード情報を取得する
  def show
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user.id) # ユーザーのid情報（カード登録した顧客情報ではない）を元に、カード情報を取得

    # マイページへいく時にカードが未登録であればカード登録へいくように設定
    redirect_to new_card_path and return unless card.present?

    customer = Payjp::Customer.retrieve(card.customer_token) # 先程のカード情報を元に、顧客情報を取得
    # 顧客が複数カードを登録している場合、その中の最初のカード情報を取得
    @card = customer.cards.first
  end

  def update
    if current_user.update(user_params) #更新できたか条件分岐
      redirect_to root_path # 更新できたらルートパスへ
    else
      redirect_to "show" #  失敗すれば再度マイページへ
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email) # 編集できる情報を制限
  end
end
