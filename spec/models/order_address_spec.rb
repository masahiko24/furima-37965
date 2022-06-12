require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address)
  end

  describe '購入情報登録' do
  context '内容に問題ない場合' do
    it "postal_codeとdelivery_area_id,city,house_number,phone_number,token,userが存在すれば保存ができること" do
      expect(@order_address).to be_valid
    end

      it 'bilding_nameは空でも保存できること' do
        @order_address.bilding_name = ''
        expect(@order_address).to be_valid
      end
    

context '内容に問題がある場合' do
it '郵便番号が必須であること。' do
  @order_address.postal_code = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Postal code can't be blank"
end

it '郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと。' do
  @order_address.postal_code = '1234567'
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Postal code is invalid. Include hyphen(-)"
end

it '都道府県が必須であること。' do
  @order_address.delivery_area_id = '0'
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Delivery area can't be blank"
end

it '市区町村が必須であること。' do
  @order_address.city = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "City can't be blank"
end

it '番地が必須であること。' do
  @order_address.house_number = ''
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "House number can't be blank"
end

it '電話番号が必須であること。' do
  @order_address.phone_number = ""
  @order_address.valid? 
  expect(@order_address.errors.full_messages).to include "Phone number can't be blank"
end

it '電話番号は、10桁以上の半角数値のみ保存可能なこと。' do
  @order_address.phone_number = "090123456"
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Phone number is invalid"
end

it '電話番号は、11桁以内の半角数値のみ保存可能なこと。' do
  @order_address.phone_number = "090123456789"
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Phone number is invalid"
end

it "tokenが空では登録できないこと" do
  @order_address.token = nil
  @order_address.valid?
  expect(@order_address.errors.full_messages).to include "Token can't be blank"
end

end
end
end
end