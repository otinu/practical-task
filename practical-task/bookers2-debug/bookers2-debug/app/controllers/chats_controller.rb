class ChatsController < ApplicationController
  def show
    #ここでは、@userは「相手」、current_userは「自分」と考えると分かりやすい。
    @user = User.find(params[:id])
    #Userモデルでthroughを活用したことで、mapメソッドやpluckメソッドを使わずとも「all_rooms」だけでUserモデルとRoomsモデルの多対多を実現。
    rooms = current_user.all_rooms
    #user_idが@user　且つ　room_idが上で取得したrooms配列の中にある数値のもののみ取得(1個または0個のはずです)
    #find_byで2つ以上のカラムを検索させた場合、全ての条件に一致するレコードが見つからない場合にはnilを返す。
    user_rooms = UserRoom.find_by(user_id: @user.id, room_id: rooms)

    if user_rooms.nil? 
      @room = Room.new
      @room.save
      UserRoom.create(user_id: @user.id, room_id: @room.id)
      UserRoom.create(user_id: current_user.id, room_id: @room.id)
    else
      @room = user_rooms.room
    end
    #if文の中で定義した@roomに紐づくchatsテーブルのレコードを代入
    @chats = @room.chats
    #chats/show.html.erbのチャットの送信フォームの中には、文字を打ち込む窓以外に隠された窓がある <%= f.hidden_field :room_id %>。
    #隠された窓には、「現在のチャットのid」が強制的に埋め込まれる。
    @chat = Chat.new(room_id: @room.id)
  end

  def create
    @chat = current_user.chats.new(chat_params)
    @chat.save
  end

  private
  def chat_params
    params.require(:chat).permit(:message, :room_id)
  end
end
