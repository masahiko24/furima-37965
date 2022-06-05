class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to_active_hash :details_category
  belongs_to_active_hash :details_condition
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :delivery_number_of_date

  validates :image, presence: true
  validates :brandname, presence: true
  validates :description, presence: true
  validates :details_category_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :details_condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_number_of_date_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :price, presence: true,
                    numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }
  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters' }
  validates :user, presence: true
end
