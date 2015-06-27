class PatisseriesAmericainesController < ApplicationController
  
  def index
    @produits = [
      @@cheese_cake_nature,
      @@cheese_cake_acidule,
      @@cheese_cake_fruits_rouges,
      @@cup_cakes,
      @@tarte_banoffee
    ]
  end

  def show
    case params[:id]
    when "cheese-cake-nature"
      @produit = @@cheese_cake_nature 
      @recommandations = [
        @@cheese_cake_acidule,
        @@cheese_cake_fruits_rouges,
        @@cup_cakes,
        @@tarte_banoffee
      ]
    when "cheese-cake-acidule"
      @produit = @@cheese_cake_acidule
      @recommandations = [
        @@cheese_cake_nature,
        @@cheese_cake_fruits_rouges,
        @@cup_cakes,
        @@tarte_banoffee
      ]
    when "cheese-cake-fruits-rouges"
      @produit = @@cheese_cake_fruits_rouges
      @recommandations = [
        @@cheese_cake_nature,
        @@cheese_cake_acidule,
        @@cup_cakes,
        @@tarte_banoffee
      ]
    when "cup-cakes"
      @produit = @@cup_cakes
      @recommandations = [
        @@cheese_cake_nature,
        @@cheese_cake_acidule,
        @@cheese_cake_fruits_rouges,
        @@tarte_banoffee
      ]
    when "tarte-banoffee"
      @produit = @@tarte_banoffee
      @recommandations = [
        @@cheese_cake_nature,
        @@cheese_cake_acidule,
        @@cheese_cake_fruits_rouges,
        @@cup_cakes
      ]
    end
  end

end
