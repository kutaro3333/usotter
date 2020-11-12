class TweetsController < ApplicationController
  def index
    @tweet = Tweet.all
  end

  def new
    # user_idから探したユーザー
    @user = User.find(params[:user_id])
  end

  def create
    # user_idから探したユーザー
    @user = User.find(params[:user_id])
    # user_idから探したユーザーでtweetを登録
    @user.tweets.create(tweet_params)
    # ツイート一覧ページへリダイレクト
    redirect_to tweets_index_path
  end

  def show
  end

  def edit
  end

  def destroy
    @tweet =  Tweet.find(params[:id])
    # tweetを削除したら投稿を削除しましたメッセージを表示してrootへリダイレクト
    if @tweet.destroy
      redirect_to "/", flash: {: "投稿を削除しました"}
    end
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
