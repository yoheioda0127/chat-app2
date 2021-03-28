class MessagesController < ApplicationController
  def index
    @message = Message.new
    @room    = Room.find(params[:room_id])
    # paramsに含まれているroom_idを代入
    # /rooms/:room_id/messagesといったパスになる
    # パスにroom_idが含まれているため、paramsというハッシュオブジェクトの中に、room_idという値が存在。
    # params[:room_id]と記述することでroom_idを取得可能。
  end

  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    # @room.newではない。これにより、チャットルームに紐づいたメッセージのインスタンスを生成
    if @message.save
      redirect_to room_messages_path(@room)
    else
      render :index
    end
  end

  private

  def message_params
    params.require(:message).permit(:content).merge(user_id: current_user.id)
    # (ログインしているユーザーのidと紐付いている)メッセージの内容contentを受け取れるように許可.
  end
end

