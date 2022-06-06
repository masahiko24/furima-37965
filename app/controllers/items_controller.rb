class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :destroy, :new, :create]
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show, :destroy, :new, :create]

  def index
    @item = Item.all.order(created_at: :desc)
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path, notice: ''
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :brandname, :description, :details_category_id, :details_condition_id,
                                 :delivery_charge_id, :delivery_area_id, :delivery_number_of_date_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless current_user.id == @item.user_id
  end
end
