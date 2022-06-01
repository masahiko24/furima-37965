class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item_params).permit(:nickname, :first_name, :last_name, :first_name_reading, :last_name_reading,
                                        :birthday).merge(user_id: current_user.id)
  end
end
