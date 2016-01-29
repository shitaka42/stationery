class Product < ActiveRecord::Base
  has_many :reviews
  has_many :genre_likes
end
