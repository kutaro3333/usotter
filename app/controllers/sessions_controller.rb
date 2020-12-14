class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:session][:email])
    if @user && @user.authenticate(params[:session][:password])
      log_in @user
      redirect_to user_path(@user), flash: {success: "ログインに成功しました"}
    else
      flash.now[:danger] = "入力に誤りがあります"
      render "new"
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
