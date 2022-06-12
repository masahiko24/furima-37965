class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :delivery_area_id, :city, :house_number, :bilding_name, :phone_number, :order_id, :user_id,
                :item_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :house_number
    validates :phone_number,
              format: { with: /\A0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1})[-)]?\d{4}\z|\A0[5789]0-?\d{4}-?\d{4}\z/ }
    validates :token
  end

  validates :delivery_area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, delivery_area_id: delivery_area_id, city: city, house_number: house_number,
                   bilding_name: bilding_name, phone_number: phone_number, order_id: order.id)
  end
end
