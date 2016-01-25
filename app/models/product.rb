class Product < ActiveRecord::Base
  has_many :reviews

  # has_attached_file :image_url,
  #                     styles: { medium: "300x300#", thumb: "100x100#"}
end
