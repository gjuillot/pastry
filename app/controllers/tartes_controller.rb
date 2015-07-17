class TartesController < ApplicationController
  
  def index
    @produits = [
      @@tarte_citron,
      @@tarte_orange_passion,
      @@tarte_rhubarbe_fraise
    ]
    @also = [
      @@tarte_automne,
      @@tarte_marron_myrtille
    ]
  end

  def show
    case params[:id]
    when "citron"
      @produit = @@tarte_citron
      @recommandations = [
        @@tarte_orange_passion,
        @@tarte_rhubarbe_fraise
      ]
    when "orange-passion"
      @produit = @@tarte_orange_passion
      @recommandations = [
        @@macaron_geant_orange_passion,
        @@entremet_souffle_passion,
        @@tarte_citron,
        @@tarte_rhubarbe_fraise
      ]
    when "rhubarbe-fraise"
      @produit = @@tarte_rhubarbe_fraise
      @recommandations = [
        @@tarte_citron,
        @@tarte_orange_passion
      ]
    end
  end

end
