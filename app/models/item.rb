class Item < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  has_one :order
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :yamato
  belongs_to :category
  has_one :pay
  validates :image ,presence: true

  with_options presence: true,numericality:{other_than:0,message:"is invalid. Include hyphen(-)"} do
  validates :area_id,:item_category_id,:yamato_id,:days_id,:item_statue_id
  end
end
