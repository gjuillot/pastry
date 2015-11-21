class PatisseriesAmericainesController < ApplicationController
  
  def index
    @produits = [
      @@cheese_cake_nature]
    @also = [
      @@cheese_cake_acidule,
      @@cheese_cake_fruits_rouges,
      @@brownie,
      @@lemon_square
    ]
  end

  def show
    case params[:id]
    when "cheese-cake-nature"
      @produit = @@cheese_cake_nature 
      @recommandations = [
      ]
    end
  end

end
