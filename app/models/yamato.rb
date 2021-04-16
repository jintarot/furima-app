class Yamato < ActiveHash::Base
  self.data = [
    
    {id:2,name:"手数料払う"},
    {id:3,name:"払わない"}
  ]
  include ActiveHash::Associations
  has_many :items
end