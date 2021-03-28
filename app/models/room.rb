class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true
end

# MessageモデルとRoomUserモデルにdependent: :destroyを記述。

# dependentオプションに:destroyを指定した場合、Room（親モデル）が削除されたときに、関連付けしているMessage（子モデル）とRoomUser（子モデル）も削除される。

# これで、roomを削除したとき、roomに関連するmessagesテーブルのレコードとroom_usersテーブルのレコードも、一緒に削除されるように設定できた。。