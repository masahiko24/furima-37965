require 'rails_helper'

RSpec.describe Item, type: :model do
before do
  @item = FactoryBot.build(:item)
end

  describe '商品登録' do

    context '商品登録が上手く行く時' do
      it "image,brandname,description,details_category,details_condition,delivery_charge,delivery_area,delivery_number_of_date,price,price_is_invalidが存在すれば登録できる" do
        expect(item).to be_valid
      end
  
  it '商品画像を1枚つけることが必須であること。'
  @item.image = ''
  @item.valid?
  binding.pry

  it '商品名が必須であること。'
  @item.brandname = ''
  @item.valid?

  it '商品の説明が必須であること。'
  @item.description = ''
  @item.valid?

  it 'カテゴリーの情報が必須であること。'
  @item.details_category = ''
  @item.valid?

  it '商品の状態の情報が必須であること。'
  @item.details_condition  = ''
  @item.valid?

  it '配送料の負担の情報が必須であること。'
  @item.elivery_charge = ''
  @item.valid?

  it '発送元の地域の情報が必須であること。'
  @item.delivery_area = ''
  @item.valid?

  it '発送までの日数の情報が必須であること。'
  @item.delivery_number_of_date = ''
  @item.valid?

  it '価格の情報が必須であること。'
  @item.price= ''
  @item.valid?

  it '価格は、¥300~¥9,999,999の間のみ保存可能であること。'
  @item.price_is_invalid = ''
  @item.valid?

  it '価格は半角数値のみ保存可能であること。'
  @item.price = ''
  @item.valid?

end
