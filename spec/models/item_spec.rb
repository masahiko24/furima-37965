require 'rails_helper'
RSpec.describe Item, type: :model do
before do
  @item = FactoryBot.build(:item)
end

describe '商品登録' do
    context '商品登録が上手く行く時' do
      it "image,brandname,description,details_category,details_condition,delivery_charge,delivery_area,delivery_number_of_date,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
 context '商品登録が上手く行かないとき' do 
  it '商品画像を1枚つけることが必須であること。' do
  @item.image = nil
  @item.valid?
  expect(@item.errors.full_messages).to include "Image can't be blank"
    end

  it '商品名が必須であること。' do
  @item.brandname = ''
  @item.valid?
  expect(@item.errors.full_messages).to include "Brandname can't be blank"
  end

  it '商品の説明が必須であること。' do
  @item.description = ''
  @item.valid?
  expect(@item.errors.full_messages).to include "Description can't be blank"
end

  it 'カテゴリーの情報が必須であること。' do
  @item.details_category_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include "Details category can't be blank"
end

  it '商品の状態の情報が必須であること。' do
  @item.details_condition_id  = ''
  @item.valid?
  expect(@item.errors.full_messages).to include "Details condition can't be blank"
end

  it '配送料の負担の情報が必須であること。' do
  @item.delivery_charge_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include "Delivery charge can't be blank"
end

  it '発送元の地域の情報が必須であること。' do
  @item.delivery_area_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include "Delivery area can't be blank"
end

  it '発送までの日数の情報が必須であること。' do
  @item.delivery_number_of_date_id = ''
  @item.valid?
  expect(@item.errors.full_messages).to include "Delivery number of date can't be blank"
end

  it '価格の情報が必須であること。' do
  @item.price= ''
  @item.valid?
  expect(@item.errors.full_messages).to include "Price can't be blank"
end

  it '価格は、¥300~¥9,999,999の間のみ保存可能であること。' do
  @item.price = '100'
  @item.valid?
  expect(@item.errors.full_messages).to include "Price is invalid"
end

  it '価格は半角数値のみ保存可能であること。' do
  @item.price = '１００００'
  @item.valid?
  expect(@item.errors.full_messages).to include "Price is invalid"
end
end
end
end
end