class Product < ActiveRecord::Base
  attr_accessible :name, :description, :allergenes, :type, :published
  has_many :product_prices, dependent: :destroy
  has_many :product_images, dependent: :destroy
  
  default_scope order("name ASC")
  
  def self.types
    %w(Tarte)
  end
  
  def image
    ProductImage.where("product_id = ? AND usage = 'main'", self.id).first rescue nil
  end
  
  def images
    ProductImage.where("product_id = ? AND usage != 'zoom'", self.id).all rescue []
  end
  
  def zoom
    ProductImage.where("product_id = ? AND usage = 'zoom'", self.id).first rescue nil
  end
  
  def prices
    product_prices
  end
  
  def allergenes_array
    allergenes.split(', ')
  end
  
end
