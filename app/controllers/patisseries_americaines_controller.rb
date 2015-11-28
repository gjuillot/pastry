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
    when "cheese-cake-acidule"
      @produit = @@cheese_cake_acidule
    when "cheese-cake-fruits-rouges"
      @produit = @@cheese_cake_fruits_rouges
    when "brownie"
      @produit = @@brownie
    when "lemon-square"
      @produit = @@lemon_square
    end
  end

end
