class TartesController < ApplicationController
  
  def index
    @produits = [
      @@tarte_agrumes,
      @@tarte_automne,
      @@tarte_orange_passion,
      @@tarte_marron_myrtille,
      @@tarte_rhubarbe_fraise
    ]
  end

  def show
    case params[:id]
    when "agrumes"
      @produit = @@tarte_agrumes
      @recommandations = [
        @@macaron_geant_agrumes,
        @@tarte_automne,
        @@tarte_orange_passion,
        @@tarte_marron_myrtille,
        @@tarte_rhubarbe_fraise
      ]
    when "automne"
      @produit = @@tarte_automne
      @recommandations = [
        @@tarte_agrumes,
        @@tarte_orange_passion,
        @@tarte_marron_myrtille,
        @@tarte_rhubarbe_fraise
      ]
    when "orange-passion"
      @produit = @@tarte_orange_passion
      @recommandations = [
        @@macaron_geant_orange_passion,
        @@entremet_passionnement_framboise,
        @@entremet_souffle_passion,
        @@tarte_agrumes,
        @@tarte_automne,
        @@tarte_marron_myrtille,
        @@tarte_rhubarbe_fraise
      ]
    when "marron-myrtille"
      @produit = @@tarte_marron_myrtille
      @recommandations = [
        @@entremet_myrtille_framboise,
        @@tarte_agrumes,
        @@tarte_automne,
        @@tarte_orange_passion,
        @@tarte_rhubarbe_fraise
      ]
    when "rhubarbe-fraise"
      @produit = @@tarte_rhubarbe_fraise
      @recommandations = [
        @@tarte_agrumes,
        @@tarte_automne,
        @@tarte_orange_passion,
        @@tarte_marron_myrtille
      ]
    end
  end

end
