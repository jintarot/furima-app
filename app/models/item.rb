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
  
end
