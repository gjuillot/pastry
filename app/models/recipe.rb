class Recipe < ActiveRecord::Base
  attr_accessible :name, :quantity, :unit, :recipe_category_id, :sellable, :public_comment
  belongs_to :recipe_category
  has_many :recipe_steps
  
  scope :basics, joins(:recipe_category).where('"recipe_categories".basic = ?', true)
  scope :sellables, where("sellable = ?", true)
  
  validates :name, length: { minimum: 2 }
  validates :quantity, :numericality => { :only_integer => true, :greater_than => 0 }
  
  UNITS = ["personnes", "parts", "g", "cl"]
  
  def category
    recipe_category.name rescue "Sans categorie"
  end
  
  def steps
    recipe_steps
  end
  
  def cost
    steps.map(&:cost).inject(0, :+)
  end
  
  def base?
    !recipe_category_id.nil? && recipe_category.basic
  end
end
