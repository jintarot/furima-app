class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item
  with_options presence: true 
end
