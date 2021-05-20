class UsersController < ApplicationController
  before_action :authenticate_user!,except:[:index]

  def index
    @users=User.all
  end

  def show
    @user = User.find(params[:id])
    @nickname = @user.nickname
    @posts = @user.posts.order(created_at: "DESC").page(params[:page]).per(12)

    #message用
    if user_signed_in?
      @currentUserEntry = Entry.where(user_id: current_user.id)
      @userEntry = Entry.where(user_id: @user.id)

      unless @user.id == current_user.id
        @currentUserEntry.each do |cu|
          @userEntry.each do |u|
            if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
            end
          end
        end

        unless @isRoom
          @room = Room.new
          @entry = Entry.new
        end
      end
    end
  end
end
