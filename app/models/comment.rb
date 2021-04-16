class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  validates :user,presence: true
  validates :item,presence: true
  validates :content,presence: true
end