class MacaronsGeantsController < ApplicationController
  
  def index
    @produits = [
      @@macaron_geant_framboise_rose_litchi,
      @@macaron_geant_orange_passion,
      @@macaron_geant_pistache_griotte ]
    @also = [
      @@macaron_geant_agrumes ]
  end

  def show
    @saison = false
    case params[:id]
    when "framboise-rose-litchi"
      @produit = @@macaron_geant_framboise_rose_litchi
      @recommandations = [
        @@entremet_myrtille_framboise,
        @@entremet_mangue_fraise,
        @@entremet_souffle_passion,
        @@macaron_geant_orange_passion,
        @@macaron_geant_pistache_griotte]
    when "orange-passion"
      @produit = @@macaron_geant_orange_passion
      @recommandations = [
        @@tarte_orange_passion,
        @@entremet_mangue_fraise,
        @@entremet_chocolat_caramel,
        @@entremet_souffle_passion,
        @@entremet_trois_chocolats,
        @@macaron_geant_framboise_rose_litchi,
        @@macaron_geant_pistache_griotte]
    when "agrumes"
      @produit = @@macaron_geant_agrumes
      @recommandations = [
        @@macaron_geant_framboise_rose_litchi,
        @@macaron_geant_orange_passion,
        @@macaron_geant_pistache_griotte]
    when "pistache-griotte"
      @produit = @@macaron_geant_pistache_griotte
      @recommandations = [
        @@macaron_geant_framboise_rose_litchi,
        @@macaron_geant_orange_passion]
      @saison = true
    end
  end

end
