class Address < ApplicationRecord

  belongs_to :buy

  validates :postal_code, presence: true
  validates :delivery_area_id, presence: true
  validates :city, presence: true
  validates :house_number, presence: true
  validates :bilding_name, presence: true, :allow_nil
  validates :phone_number, presence: true

end
