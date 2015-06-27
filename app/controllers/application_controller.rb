class ApplicationController < ActionController::Base
  protect_from_forgery
  
  ###############
  ## ENTREMETS ##
  ###############
  
  @@entremet_chocolat_caramel = {
    name: "Le Chocolat Caramel beurre sal&eacute;",
    images: ["entremets/chocolat-caramel"],
    text: "Brownie, mousse chocolat au lait et f&egrave;ve de Tonka, cr&eacute;meux caramel au beurre sal&eacute; et mousse chocolat noir",
    url: "/entremets/chocolat-caramel.html"
  }
  
  @@entremet_mangue_passion = {
    name: "Mangue passion",
    images: ["entremets/mangue-passion"],
    text: "Dacquoise coco, confit orange passion, mousse mague passion, cr&eacute;meux citron vert, nougatine coco, chantilly mascarpone des &icirc;les",
    url: "/entremets/mangue-passion.html"
  }
  
  @@entremet_myrtille_framboise = {
    name: "Myrtille Framboise",
    images: ["entremets/myrtille-framboise"],
    text: "Dacquoise pistache, mousse myrtille, confit framboise, nougatine amande",
    url: "/entremets/myrtille-framboise.html"
  }
  
  @@entremet_passionnement_framboise = {
    name: "Passionn&eacute;ment framboise",
    images: ["entremets/passionnement-framboise"],
    text: "Dacquoise pistache, mousse framboise, confit fruit de la passion, nougatine amande",
    url: "/entremets/passionnement-framboise.html"
  }
  
  @@entremet_royal = {
    name: "Le Royal",
    images: ["entremets/royal"],
    text: "Dacquoise amande noisette, croustillant pralin&eacute;, mousse chocolat noir.",
    url: "/entremets/royal.html"
  }
  
  @@entremet_souffle_passion = {
    name: "Souffl&eacute; passion",
    images: ["entremets/souffle-passion"],
    text: "Dacquoise coco, souffl&eacute; passion, &eacute;clats de framboises",
    url: "/entremets/souffle-passion.html"
  }
  
  @@entremet_trois_chocolats = {
    name: "Le Trois Chocolats",
    images: ["entremets/trois-chocolats"],
    text: "Biscuit chocolat, croustillant pralin&eacute;, mousse chocolat noir, mousse chocolat au lait, mousse chocolat blanc.",
    url: "/entremets/trois-chocolats.html"
  }
  
  ############
  # MACARONS #
  ############
  
  @@macaron_pistache_griotte = {
    name: "Macaron Pistache griotte",
    images: ["macarons/pistache-griotte_rectangle"],
    text: "",
    url: "/macarons"
  }
  
  ###################
  # MACARONS GEANTS #
  ###################
  
  @@macaron_geant_agrumes = {
    name: "Macaron g&eacute;ant Agrumes",
    images: ["macarons_geants/agrumes"],
    text: "Confit orange passion, cr&eacute;meux agrume, chantilly mascarpone des &icirc;les;",
    url: "/macarons_geants/agrumes.html"
  }
  
  @@macaron_geant_framboise_rose_litchi = {
    name: "Macaron g&eacute;ant Framboise, rose et litchi",
    images: ["macarons_geants/framboise-rose-litchi"],
    text: "Confit framboise litchi, ganache mont&eacute;e rose litchi, framboises fraiches.",
    url: "/macarons_geants/framboise-rose-litchi.html"
  }
  
  @@macaron_geant_orange_passion = {
    name: "Macaron g&eacute;ant Orange passion",
    images: ["macarons_geants/orange-passion"],
    text: "Confit orange passion, ganache mont&eacute;e chocolat noir, orange et fruit de la passion frais.",
    url: "/macarons_geants/orange-passion.html"
  }
  
  @@macaron_geant_pistache_griotte = {
    name: "Macaron g&eacute;ant Pistache griotte",
    images: ["macarons_geants/pistache-griotte"],
    text: "Confit griotte, ganache mont&eacute;e pistache, &eacute;clats de griottes et de pistache.",
    url: "/macarons_geants/pistache-griotte.html"
  }
  
  ##########
  # TARTES #
  ##########
  
  @@tarte_agrumes = {
    name: "Tarte Agrumes meringu&eacute;e",
    images: ["tartes/agrumes"],
    text: "Fond sucr&eacute; frangipane, cr&eacute;meux aux agrumes et meringue.",
    url: "/tartes/agrumes.html"
  }
  
  @@tarte_automne = {
    name: "Tarte d'automne",
    images: ["tartes/automne"],
    text: "Fond sucr&eacute;, cr&eagrave;me de noisette, pomme poire, flan et fruits sec.",
    url: "/tartes/automne.html"
  }
  
  @@tarte_orange_passion = {
    name: "Tarte Orange passion",
    images: ["tartes/orange-passion"],
    text: "Fond sucr&eacute;, confit orange passion, cr&eacute;meux passion fa&ccedil;on cr&egrave;me br&ucirc;l&eacute;e.",
    url: "/tartes/orange-passion.html"
  }
  
  @@tarte_marron_myrtille = {
    name: "Tarte Marron Myrtille",
    images: ["tartes/marron-myrtille"],
    text: "Fond sucr&eacute; frangipane, cr&egrave;me diplomate, meringue, cr&eacute;meux myrtille et ses vermicelles cr&eacute;me aux marrons.",
    url: "/tartes/marron-myrtille.html"
  }
  
  @@tarte_rhubarbe_fraise = {
    name: "Tarte Rhubarbe fraise",
    images: ["tartes/rhubarbe-fraise"],
    text: "Fond sucr&eacute;, compot&eacute; rhubarbe fraise, cr&eacute;meux vanille fa&ccedil;on cr&egrave;me br&ucirc;l&eacute;e et fraise fraiche et rhubarbe poch&eacute;e.",
    url: "/tartes/rhubarbe-fraise.html"
  }
  
  ###########################
  # PATISSERIES AMERICAINES #
  ###########################
  
  @@cheese_cake_nature = {
    name: "Cheese Cake nature",
    images: ["amerique/cheese-cake-nature"],
    text: "Fond biscuit maison et cream cheese Philadelphia&reg; citron&eacute;. Coulis au choix : faise, framboise, mangue, passion, lemon curd.",
    url: "/patisseries_americaines/cheese-cake-nature.html"
  }
  
  @@cheese_cake_acidule = {
    name: "Cheese Cake acidul&eacute;",
    images: ["amerique/cheese-cake-acidule"],
    text: "Fond biscuit maison et cream cheese Philadelphia&reg; au citron vert et sa gel&eacute;e de pamplemousse.",
    url: "/patisseries_americaines/cheese-cake-acidule.html"
  }
  
  @@cheese_cake_fruits_rouges = {
    name: "Cheese Cake non cuit aux fruits rouges",
    images: ["amerique/cheese-cake-fruits-rouges"],
    text: "Fond biscuit maison aux flocons d'avoine et canneberges, cream cheese Philadelphia&reg; aux fruits rouges",
    url: "/patisseries_americaines/cheese-cake-fruits-rouges.html"
  }
  
  @@cup_cakes = {
    name: "Cup Cakes",
    images: ["amerique/cup-cakes"],
    text: "Divers parfums, nous consulter",
    url: "/patisseries_americaines/cup-cakes.html"
  }
  
  @@tarte_banoffee = {
    name: "Tarte Banoffee",
    images: ["amerique/tarte-banoffee"],
    text: "Biscuit fa&ccedil;on sp&eacute;culos, toffee massson, bananes et cr&egrave;me mascarpone vanille",
    url: "/patisseries_americaines/tarte-banoffee.html"
  }
  

end
