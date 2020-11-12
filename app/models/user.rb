class User < ApplicationRecord
  has_many :tweets
  # presence：登録する際に空白だった場合エラーを返す
  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true
  # セキュアにハッシュ化したパスワードを保存できるようになる
  # authenticateメソッドが使えるようになる
  # モデル内にpassword_digestという属性が含まれていることが条件
  has_secure_password
end
