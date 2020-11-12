class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.save
    log_in @user
    redirect_to @user
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_update_params)
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path
    end
  end

  private
  def user_params
    # 不要なパラメータを取り除く処理
    # Userモデルに登録するため、emailとpasswordだけ受け入れる
    # passwordとpassword_confirmationという項目をフォームで送ると、bcryptが勝手に暗号化して、password_digestというカラムに暗号化したデータをいれてくれる
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

  def user_update_params
    params.require(:user).permit(:email)
  end
end
