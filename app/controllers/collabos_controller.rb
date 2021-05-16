class CollabosController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show]

  def new
    @collabo = Collabo.new
  end

  def create
    @collabo = Collabo.new(collabo_params)
    if @collabo.save!
      redirect_to "/users/#{current_user.id}"
    else
      render :new
    end
  end

  def index
    @collabos = Collabo.all
  end

  def show
    @collabo = Collabo.find(params[:id])
  end

  private

  def collabo_params
    params.require(:collabo).permit(:title, :text, :image, :originator_id).merge(painter_id: current_user.id)
  end
end
