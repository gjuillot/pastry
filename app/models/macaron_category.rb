class MacaronCategory < ActiveRecord::Base
  attr_accessible :name
  has_many :macaron_parfums
end
