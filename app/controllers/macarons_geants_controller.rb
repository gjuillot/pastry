class MacaronsGeantsController < ApplicationController
  
  def index
    @produits = [{
        name: "Framboise, rose et litchi",
        image: "framboise-rose-litchi",
        text: "Confit framboise litchi, ganache mont&eacute;e rose litchi, framboises fraiches."
      }, {
        name: "Orange passion",
        image: "orange-passion",
        text: "Confit orange passion, ganache mont&eacute;e chocolat noir, orange et fruit de la passion frais;"
      }, {
        name: "Agrumes",
        image: "agrumes",
        text: "Confit orange passion, cr&eacute;meux agrume, chantilly mascarpone des &icirc;les;"
      }, {
        name: "Pistache griotte",
        image: "pistache-griotte",
        text: "Confit griotte, ganache mont&eacute;e pistache, &eacute;clats de griottes et de pistache."
      }]
  end

  def show
    case params[:id]
    when "framboise-rose-litchi"
      @produit = {
          name: "Framboise, rose et litchi",
          images: ["framboise-rose-litchi"],
          text: "Confit framboise litchi, ganache mont&eacute;e rose litchi, framboises fraiches."
        }
        @recommandations = [{
          name: "Macaron g&eacute;ant Orange passion",
          image: "macarons_geants/orange-passion",
          url: "/macarons_geants/orange-passion.html"
        }, {
          name: "Macaron g&eacute;ant Agrumes",
          image: "macarons_geants/agrumes",
          url: "/macarons_geants/agrumes.html"
        }, {
          name: "Macaron g&eacute;ant Pistache griotte",
          image: "macarons_geants/pistache-griotte",
          url: "/macarons_geants/pistache-griotte.html"
        }]
    when "orange-passion"
      @produit = {
          name: "Orange passion",
          images: ["orange-passion"],
          text: "Confit orange passion, ganache mont&eacute;e chocolat noir, orange et fruit de la passion frais;"
        }
        @recommandations = [{
          name: "Macaron g&eacute;ant Framboise, rose et litchi",
          image: "macarons_geants/framboise-rose-litchi",
          url: "/macarons_geants/framboise-rose-litchi.html"
        }, {
          name: "Macaron g&eacute;ant Agrumes",
          image: "macarons_geants/agrumes",
          url: "/macarons_geants/agrumes.html"
        }, {
          name: "Macaron g&eacute;ant Pistache griotte",
          image: "macarons_geants/pistache-griotte",
          url: "/macarons_geants/pistache-griotte.html"
        }]
    when "agrumes"
      @produit = {
          name: "Agrumes",
          images: ["agrumes"],
          text: "Confit orange passion, cr&eacute;meux agrume, chantilly mascarpone des &icirc;les;"
        }
        @recommandations = [{
          name: "Macaron g&eacute;ant Framboise, rose et litchi",
          image: "macarons_geants/framboise-rose-litchi",
          url: "/macarons_geants/framboise-rose-litchi.html"
        }, {
          name: "Macaron g&eacute;ant Orange passion",
          image: "macarons_geants/orange-passion",
          url: "/macarons_geants/orange-passion.html"
        }, {
          name: "Macaron g&eacute;ant Pistache griotte",
          image: "macarons_geants/pistache-griotte",
          url: "/macarons_geants/pistache-griotte.html"
        }]
    when "pistache-griotte"
      @produit = {
          name: "Pistache griotte",
          images: ["pistache-griotte"],
          text: "Confit griotte, ganache mont&eacute;e pistache, &eacute;clats de griottes et de pistache."
        }
        @recommandations = [{
          name: "Macaron g&eacute;ant Framboise, rose et litchi",
          image: "macarons_geants/framboise-rose-litchi",
          url: "/macarons_geants/framboise-rose-litchi.html"
        }, {
          name: "Macaron g&eacute;ant Orange passion",
          image: "macarons_geants/orange-passion",
          url: "/macarons_geants/orange-passion.html"
        }, {
          name: "Macaron g&eacute;ant Agrumes",
          image: "macarons_geants/agrumes",
          url: "/macarons_geants/agrumes.html"
        }]
    end
  end

end
