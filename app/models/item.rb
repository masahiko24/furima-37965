class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to :details_category
  belongs_to :details_condition
  belongs_to :delivery_charge
  belongs_to :delivery_area
  belongs_to :delivery_number_of_date

  validates :brandname, presence: true
  validates :description, presence: true
  validates :details_category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :details_condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_number_of_date_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "is invalid"}

end
