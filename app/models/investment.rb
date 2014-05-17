class Investment < ActiveRecord::Base
  attr_accessible :comment, :investment_category_id, :name, :price, :user, :created_at
  belongs_to :investment_category
  belongs_to :user
  
  default_scope order("created_at DESC")
  
  def category
    investment_category.name
  end
end
