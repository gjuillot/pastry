class EntremetsController < ApplicationController
  def index
    @produits = [
        @@entremet_chocolat_caramel,
        @@entremet_exotique,
        @@entremet_mangue_fraise,
        @@entremet_myrtille_framboise,
        @@entremet_royal,
        @@entremet_souffle_passion,
        @@entremet_trois_chocolats
        ]
    @also = [
        @@entremet_passionnement_framboise,
        @@entremet_orangette
    ]
  end

  def show
    case params[:id]
    when "chocolat-caramel"
      @produit = @@entremet_chocolat_caramel
      @recommandations = [
        @@macaron_geant_orange_passion,
        @@entremet_trois_chocolats,
        @@entremet_royal,
        @@entremet_exotique,
        @@entremet_myrtille_framboise,
        @@entremet_mangue_fraise,
        @@entremet_souffle_passion
      ]
    when "exotique"
      @produit = @@entremet_exotique
      @recommandations = [
        @@entremet_souffle_passion,
        @@tarte_orange_passion,
        @@macaron_geant_orange_passion,
        @@entremet_chocolat_caramel,
        @@entremet_myrtille_framboise,
        @@entremet_mangue_fraise,
        @@entremet_royal,
        @@entremet_trois_chocolats
      ]
    when "myrtille-framboise"
      @produit = @@entremet_myrtille_framboise
      @recommandations = [
        @@macaron_geant_framboise_rose_litchi,
        @@entremet_chocolat_caramel,
        @@entremet_exotique,
        @@entremet_mangue_fraise,
        @@entremet_royal,
        @@entremet_souffle_passion,
        @@entremet_trois_chocolats
      ]
    when "mangue-fraise"
      @produit = @@entremet_mangue_fraise 
      @recommandations = [
        @@macaron_geant_framboise_rose_litchi,
        @@macaron_geant_orange_passion,
        @@tarte_orange_passion,
        @@entremet_chocolat_caramel,
        @@entremet_exotique,
        @@entremet_myrtille_framboise,
        @@entremet_royal,
        @@entremet_souffle_passion,
        @@entremet_trois_chocolats
      ]
    when "royal"
      @produit = @@entremet_royal
      @recommandations = [
        @@entremet_chocolat_caramel,
        @@entremet_exotique,
        @@entremet_myrtille_framboise,
        @@entremet_mangue_fraise,
        @@entremet_souffle_passion,
        @@entremet_trois_chocolats
      ]
    when "souffle-passion"
      @produit = @@entremet_souffle_passion
      @recommandations = [
        @@macaron_geant_framboise_rose_litchi,
        @@macaron_geant_orange_passion,
        @@tarte_orange_passion,
        @@entremet_chocolat_caramel,
        @@entremet_exotique,
        @@entremet_myrtille_framboise,
        @@entremet_mangue_fraise,
        @@entremet_royal,
        @@entremet_trois_chocolats
      ]
    when "trois-chocolats"
      @produit = @@entremet_trois_chocolats
      @recommandations = [
        @@macaron_geant_orange_passion,
        @@entremet_chocolat_caramel,
        @@entremet_exotique,
        @@entremet_myrtille_framboise,
        @@entremet_mangue_fraise,
        @@entremet_royal,
        @@entremet_souffle_passion
      ]
    when "passionnement-framboise"
      @produit = @@entremet_passionnement_framboise
      @recommandations = [
        @@entremet_exotique,
        @@entremet_myrtille_framboise,
        @@entremet_mangue_fraise,
        @@entremet_souffle_passion
      ]
    when "orangette"
      @produit = @@entremet_orangette
      @recommandations = [
        @@entremet_trois_chocolats,
        @@entremet_chocolat_caramel,
        @@entremet_exotique,
        @@entremet_royal,
      ]
    end
  end

end
