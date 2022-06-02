class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :user
  has_one_attached :image

  belongs_to :details_category_id
  belongs_to :details_condition_id
  belongs_to :delivery_charge_id
  belongs_to :delivery_area_id
  belongs_to :delivery_number_of_date_id

  validates :title, presence: true
  validates :text, presence: true
  validates :details_category_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :details_condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_charge_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :delivery_number_of_date_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :price, presence: true
  validates :title, presence: true


end
