class UsersController < ApplicationController
  def show
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
