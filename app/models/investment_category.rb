class InvestmentCategory < ActiveRecord::Base
  attr_accessible :name
  
  validates :name, length: { minimum: 2 }
end
