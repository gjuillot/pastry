class ApplicationController < ActionController::Base
  protect_from_forgery
  
  @@forbidden = "/index"
  
  ###############
  ## ENTREMETS ##
  ###############
  
  @@entremet_chocolat_caramel = {
    name: "Le Chocolat Tonka Caramel",
    images: [
      "https://40.media.tumblr.com/315c86f596f641289f261d03af188e4b/tumblr_nrkyp7ve2j1uadryro6_r1_1280.jpg",
      "https://36.media.tumblr.com/3978664abbc2cec1a13d8a874f924919/tumblr_nrkyp7ve2j1uadryro2_1280.jpg",
      "https://40.media.tumblr.com/4f4745e9f566ef417bc074504eab2f46/tumblr_nrkyp7ve2j1uadryro3_1280.jpg",
      "https://41.media.tumblr.com/71c6bc2360d92f9e51c8582ea4bf14e6/tumblr_nrkyp7ve2j1uadryro4_1280.jpg"],
    zoom: "https://41.media.tumblr.com/567f0aa045b31fc476523f131df53ac8/tumblr_nrkyp7ve2j1uadryro5_1280.jpg",
    text: "Brownie, mousse chocolat au lait et f&egrave;ve de Tonka, cr&eacute;meux caramel au beurre sal&eacute; et mousse chocolat noir 70%",
    url: "/entremets/chocolat-caramel.html",
    allergenes: ["Fruits &agrave; coque (en d&eacute;coration)", "Lactose"],
    prix: ["27", "40,50", "58,50"]
  }
  
  @@entremet_exotique = {
    name: "Mangue Passion",
    images: [
      "https://40.media.tumblr.com/3f1816c3350e6ce6c5f42940ebc31b82/tumblr_nrl494jtjq1uadryro4_r1_1280.jpg",
      "https://40.media.tumblr.com/790db5407df4e9d6bea5ba7a7748d8ff/tumblr_nrl494jtjq1uadryro1_r1_1280.jpg"],
    zoom: "https://41.media.tumblr.com/5de7063036c9ea69b1cef64c433fc1ed/tumblr_nrl494jtjq1uadryro5_r1_540.jpg",
    text: "Dacquoise coco, confit orange passion, mousse mague passion, cr&eacute;meux citron vert, chantilly mascarpone des &icirc;les",
    url: "/entremets/exotique.html",
    allergenes: ["Fruits &agrave; coque", "Lactose", "&OElig;uf"],
    prix: ["27", "40,50", "58,50"]
  }
  
  @@entremet_myrtille_framboise = {
    name: "Myrtille Framboise",
    images: [
      "https://41.media.tumblr.com/16d738ff288457fcb6731d4cb596a8a8/tumblr_nrky0kS6I91uadryro6_r1_1280.jpg",
      "https://41.media.tumblr.com/945ff03c1b265f63c6f6205cced1742d/tumblr_nrky0kS6I91uadryro2_1280.jpg",
      "https://41.media.tumblr.com/bb42bb1f00513eac78d8a35ccb4dd705/tumblr_nrky0kS6I91uadryro3_1280.jpg",
      "https://41.media.tumblr.com/ce23cd4f7cc67ab967856c9b74b9c0a1/tumblr_nrky0kS6I91uadryro4_1280.jpg"],
    zoom: "https://41.media.tumblr.com/5d6ccd5b2dc3fec17c04ec6590147d1c/tumblr_nrky0kS6I91uadryro5_1280.jpg",
    text: "Dacquoise pistache, mousse myrtille, confit framboise",
    url: "/entremets/myrtille-framboise.html",
    allergenes: ["Fruits &agrave; coque", "Lactose", "&OElig;uf"],
    prix: ["31", "47", "67,50"]
  }
  
  @@entremet_mangue_fraise = {
    name: "Mangue fraise",
    images: [
      "https://40.media.tumblr.com/871515960a457deedbc60ce2e2df1c4d/tumblr_nrl53rmljM1uadryro1_1280.jpg",
      "https://41.media.tumblr.com/b0acd2f28ee902a4973bc74df6872b8e/tumblr_nrl53rmljM1uadryro2_1280.jpg",
      "https://40.media.tumblr.com/2aab5b10db3c84cbe02713da831f432a/tumblr_nrl53rmljM1uadryro3_1280.jpg"],
    zoom: "https://41.media.tumblr.com/03251c14f5d954cc97fe6773847870f0/tumblr_nrl53rmljM1uadryro4_1280.jpg",
    text: "Biscuit joconde, croustillant chocolat blanc et fraise, mousse fraise, mousse mangue",
    url: "/entremets/mangue-fraise.html",
    allergenes: ["Fruits &agrave; coque", "Gluten", "Lactose", "&OElig;uf"],
    prix: ["24", "36", "52"]
  }
  
  @@entremet_royal = {
    name: "Le Royal",
    images: [
      "https://40.media.tumblr.com/e21cdbd05e390730dda787019d1b5f9f/tumblr_nrkx7uyTo41uadryro1_1280.jpg",
      "https://41.media.tumblr.com/904703af0b4cc6f82af3e05b66941b7e/tumblr_nrkx7uyTo41uadryro2_1280.jpg",
      "https://41.media.tumblr.com/27455912ceae8b897e140b4eec1ff4e9/tumblr_nrkx7uyTo41uadryro3_1280.jpg",
      "https://40.media.tumblr.com/97a1b5b1b76a20d8cef1aabb6681c4e9/tumblr_nrkx7uyTo41uadryro4_1280.jpg"],
    zoom: "https://40.media.tumblr.com/911b8d2c05b0a20777446dad5e4ef92e/tumblr_nrkx7uyTo41uadryro5_1280.jpg",
    text: "Dacquoise amande noisette, croustillant pralin&eacute;, mousse chocolat noir 70%.",
    url: "/entremets/royal.html",
    allergenes: ["Fruits &agrave; coque", "Lactose", "&OElig;uf"],
    prix: ["27", "40,50", "58,50"]
  }
  
  @@entremet_souffle_passion = {
    name: "Souffl&eacute; passion",
    images: [
      "https://36.media.tumblr.com/5817120dd74fa4d943da975bee815af3/tumblr_nrl35jH0Cs1uadryro5_r1_1280.jpg",
      "https://40.media.tumblr.com/66c17cf79cd5bedaf7d390a7c42cb110/tumblr_nrl35jH0Cs1uadryro6_r1_1280.jpg",
      "https://41.media.tumblr.com/6738d1b27f19d4ebd0c0c01161b553dc/tumblr_nrl35jH0Cs1uadryro3_1280.jpg"],
    zoom: "https://40.media.tumblr.com/989d532d3bb25594c9452cf67d695289/tumblr_nrl35jH0Cs1uadryro7_r1_540.jpg",
    text: "Dacquoise coco, souffl&eacute; passion, &eacute;clats de framboises",
    url: "/entremets/souffle-passion.html",
    allergenes: ["Fruits &agrave; coque", "&OElig;uf"],
    prix: ["27", "40,50", "58,50"]
  }
  
  @@entremet_trois_chocolats = {
    name: "Le Trois Chocolats",
    images: [
      "https://40.media.tumblr.com/174a9289ad148567533fd78af4053f8e/tumblr_nrjn24sycj1uadryro6_r1_1280.jpg",
      "https://41.media.tumblr.com/ea8ceaedaf7c3e7eea7c82d2c629d9b6/tumblr_nrjn24sycj1uadryro7_r1_1280.jpg",
      "https://41.media.tumblr.com/a542760838123c84f51115f0bb12169a/tumblr_nrjn24sycj1uadryro1_r2_1280.jpg",
      "http://40.media.tumblr.com/6bcca1793ee610381458e82ae20f5fba/tumblr_nrjn24sycj1uadryro4_r1_1280.jpg"],
    zoom: "https://40.media.tumblr.com/e27a2641b700ed57320eec1cf2353b69/tumblr_nrjn24sycj1uadryro5_r1_540.jpg",
    text: "Biscuit chocolat, croustillant pralin&eacute;, mousse chocolat noir 70%, mousse chocolat au lait, mousse chocolat blanc.",
    url: "/entremets/trois-chocolats.html",
    allergenes: ["Fruits &agrave; coque", "Gluten", "Lactose", "&OElig;uf"],
    prix: ["24", "36", "52"]
  }
  
  @@entremet_passionnement_framboise = {
    name: "Passionn&eacute;ment Framboise",
    text: "Dacquoise pistache, mousse framboise, confit fruit de la passion",
    url: "/entremets/passionnement-framboise.html",
    allergenes: ["Fruits &agrave; coque", "Gluten", "Lactose", "&OElig;uf"],
    prix: ["29", "43", "62,50"]
  }
  
  @@entremet_orangette = {
    name: "Orangette",
    text: "Mousse chocolat noir 70%, cr&eacute;meux orange, financier orange",
    url: "/entremets/orangette.html",
    allergenes: ["Fruits &agrave; coque", "Gluten", "Lactose", "&OElig;uf"],
    prix: ["27", "40,50", "58,50"]
  }
  
  @@entremet_cafe = {
    name: "Caf&eacute;",
    text: "Biscuit caf&eacute;, cr&eacute;meux caf&eacute;, mousse chocolat noir et caf&eacute;",
    url: "/entremets/cafe.html",
    allergenes: ["Fruits &agrave; coque", "Gluten", "Lactose", "&OElig;uf"],
    prix: ["27", "40,50", "58,50"]
  }
  
  @@entremet_chocolat_griotte = {
    name: "Chocolat Griotte",
    text: "Biscuit chocolat noir, confit cerise noire, mousse griotte et chocolat noir 60%, cr&eacute;meux cerise noire",
    url: "/entremets/chocolat_griotte.html",
    allergenes: ["Gluten", "Lactose", "&OElig;uf"],
    prix: ["27", "40,50", "58,50"]
  }
  
  @@entremet_amoureux = {
    name: "Amoureux",
    text: "Biscuit chocolat noir, confit framboise et rose, cr&eacute;meux framboise et citron vert. Mousse au choix: litchi ou mascarpone citron vert et vanille</li></ul>",
    url: "/entremets/amoureux.html",
    allergenes: ["Gluten", "Lactose", "&OElig;uf"],
    prix: ["15.50"]
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
    text: "Confit orange passion, cr&eacute;meux agrume, chantilly mascarpone des &icirc;les",
    url: "/macarons_geants/agrumes.html",
    prix: ["36", "54", "78"]
  }
  
  @@macaron_geant_framboise_rose_litchi = {
    name: "Macaron g&eacute;ant Framboise, rose et litchi",
    images: [
      "https://36.media.tumblr.com/4cb0a2ec477ad6933684ec6609e63f60/tumblr_nrm3sk2XJA1uadryro5_r1_1280.jpg",
      "https://36.media.tumblr.com/7c32a749265ec9ff46ae4bff92adf819/tumblr_nrm3sk2XJA1uadryro6_r1_1280.jpg",
      "https://40.media.tumblr.com/2ae5994d9089dc04824cb5bb43708110/tumblr_nrm3sk2XJA1uadryro8_r1_1280.jpg"],
    zoom: "https://41.media.tumblr.com/aca66381d5175401dca44b49f97829c0/tumblr_nrm3sk2XJA1uadryro7_r1_1280.jpg",
    text: "Confit framboise litchi, ganache mont&eacute;e rose litchi, framboises fraiches.",
    url: "/macarons_geants/framboise-rose-litchi.html",
    prix: ["39", "58.50", "84.50"]
  }
  
  @@macaron_geant_orange_passion = {
    name: "Macaron g&eacute;ant Orange passion",
    images: [
      "https://41.media.tumblr.com/369a92d4f94db36f7ee6f9ca1dc7bcbd/tumblr_nrm35wWx3R1uadryro1_1280.jpg",
      "https://40.media.tumblr.com/6dddf93911f046fb262217289ec1e822/tumblr_nrm35wWx3R1uadryro2_1280.jpg",
      "https://41.media.tumblr.com/7f9c205aa5a86a640323cbb28d150f02/tumblr_nrm35wWx3R1uadryro3_1280.jpg",
      "https://41.media.tumblr.com/2494281dc0f2dfc98e58bbe6095e2e14/tumblr_nrm35wWx3R1uadryro4_1280.jpg"],
    zoom: "https://40.media.tumblr.com/a2e0963cb2b570a435c4a6e82c6bad26/tumblr_nrm35wWx3R1uadryro5_1280.jpg",
    text: "Confit orange passion, ganache mont&eacute;e chocolat noir 70%, orange et fruit de la passion frais.",
    url: "/macarons_geants/orange-passion.html",
    prix: ["36", "54", "78"]
  }
  
  @@macaron_geant_pistache_griotte = {
    name: "Macaron g&eacute;ant Pistache griotte",
    images: [
      "https://40.media.tumblr.com/d64fa38a21724784016171368306d20d/tumblr_nrm1euHtdy1uadryro1_1280.jpg",
      "https://36.media.tumblr.com/228ec6f5d69a2d8b6431ed290622c662/tumblr_nrm1euHtdy1uadryro2_1280.jpg",
      "https://36.media.tumblr.com/6538cab55ae83ac073da2e6410afe198/tumblr_nrm1euHtdy1uadryro3_1280.jpg",
      "https://40.media.tumblr.com/a37659aa8cd27d6025b666ff72052dc0/tumblr_nrm1euHtdy1uadryro4_1280.jpg"],
    zoom: "https://40.media.tumblr.com/1b73d1b1b4c48d6196bed51344708ade/tumblr_nrm1euHtdy1uadryro5_1280.jpg",
    text: "Confit griotte, ganache mont&eacute;e pistache, &eacute;clats de griottes et de pistache.",
    url: "/macarons_geants/pistache-griotte.html",
    prix: ["42", "63", "91"]
  }
  
  ##########
  # TARTES #
  ##########
  
  @@tarte_citron = {
    name: "Tarte Citron meringu&eacute;e",
    images: [
      "https://41.media.tumblr.com/e12f39a9333cb7a24b9e0704cfd75d64/tumblr_nrmkryVHLV1uadryro6_r1_540.jpg",
      "https://41.media.tumblr.com/87ac80dfc3eb883e1333b71e708628e0/tumblr_nrmkryVHLV1uadryro2_1280.jpg",
      "https://40.media.tumblr.com/86778015a5d2ffa271ff8fe7aeb2bf85/tumblr_nrmkryVHLV1uadryro3_1280.jpg",
      "https://41.media.tumblr.com/b1f8245d54ff1eed7f48e60041dee741/tumblr_nrmkryVHLV1uadryro4_1280.jpg"],
    zoom: "https://41.media.tumblr.com/5652d093686a149b503f5105c7013906/tumblr_nrmkryVHLV1uadryro1_r1_540.jpg",
    text: "Fond sucr&eacute; frangipane, cr&eacute;meux au citron et meringue.",
    url: "/tartes/citron.html",
    prix: ["24", "36", "52"]
  }
  
  @@tarte_agrumes = {
    name: "Tarte Agrumes meringu&eacute;e",
    text: "Fond sucr&eacute; frangipane, cr&eacute;meux aux agrumes et meringue.",
    url: "/tartes/agrumes.html",
    prix: ["26", "39", "56,50"]
  }
  
  @@tarte_automne = {
    name: "Tarte d'automne",
    text: "Fond sucr&eacute;, cr&egrave;me de noisette, pomme poire, flan et fruits sec.",
    url: "/tartes/automne.html",
    prix: ["26", "39", "56,50"]
  }
  
  @@tarte_orange_passion = {
    name: "Tarte Orange passion",
    images: [
      "https://40.media.tumblr.com/180e76046f3b0961ccf70467ba5fab87/tumblr_nrmhggwPL81uadryro1_1280.jpg",
      "https://40.media.tumblr.com/ffd66484f72f0a8d4819458f0d30196c/tumblr_nrmhggwPL81uadryro2_1280.jpg",
      "https://36.media.tumblr.com/f3a70a7a5390868ed33a39aac3e4a353/tumblr_nrmhggwPL81uadryro3_1280.jpg",
      "https://41.media.tumblr.com/4e92b1699ba78558c017eb217047bb18/tumblr_nrmhggwPL81uadryro4_1280.jpg"],
    zoom: "https://41.media.tumblr.com/db225e5532fce4f215eab9e5dc3e4416/tumblr_nrmhggwPL81uadryro5_1280.jpg",
    text: "Fond sucr&eacute;, confit orange passion, cr&eacute;meux passion fa&ccedil;on cr&egrave;me br&ucirc;l&eacute;e.",
    url: "/tartes/orange-passion.html",
    prix: ["29", "43,50", "56,50"]
  }
  
  @@tarte_marron_myrtille = {
    name: "Tarte Marron Myrtille",
    text: "Fond sucr&eacute; frangipane, cr&egrave;me diplomate, meringue, cr&eacute;meux myrtille et ses vermicelles cr&eacute;me aux marrons.",
    url: "/tartes/marron-myrtille.html",
    prix: ["26", "39", "56,50"]
  }
  
  @@tarte_rhubarbe_fraise = {
    name: "Tarte Rhubarbe fraise",
    images: [
      "https://40.media.tumblr.com/8c12a295a1f717575865e31646a4e54f/tumblr_nrm60nDM6v1uadryro1_1280.jpg",
      "https://40.media.tumblr.com/485503b7e8788f9cb6ee6fdb5c7616c5/tumblr_nrm60nDM6v1uadryro2_1280.jpg",
      "https://40.media.tumblr.com/644080eeaeab7e699c8b168df36d25df/tumblr_nrm60nDM6v1uadryro6_r1_1280.jpg",
      "https://40.media.tumblr.com/fc5358148aea949bb585fb7191094f6e/tumblr_nrm60nDM6v1uadryro4_1280.jpg",
      "https://40.media.tumblr.com/a3485d7dc9b3d9d42e85de4936a1d525/tumblr_nrm60nDM6v1uadryro3_1280.jpg"],
    zoom: "https://40.media.tumblr.com/5aa3534da51de004086b26bf25991822/tumblr_nrm60nDM6v1uadryro5_1280.jpg",
    text: "Fond sucr&eacute;, compot&eacute; rhubarbe fraise, cr&eacute;meux vanille fa&ccedil;on cr&egrave;me br&ucirc;l&eacute;e et fraise fraiche et rhubarbe poch&eacute;e.",
    url: "/tartes/rhubarbe-fraise.html",
    prix: ["26", "39", "56,50"]
  }
  
  ###########################
  # PATISSERIES AMERICAINES #
  ###########################
  
  @@cheese_cake_nature = {
    name: "Cheese Cake nature",
    images: [
      "https://40.media.tumblr.com/03ef2fd18b6914cf7ecc03e788ee1cd2/tumblr_nrmp6c3cYL1uadryro3_r1_540.jpg"],
    zoom: "https://40.media.tumblr.com/98617607dfef3fed7f291272657ffaa1/tumblr_nrmp6c3cYL1uadryro4_r1_1280.jpg",
    text: "Fond biscuit maison et cream cheese Philadelphia&reg; citron&eacute;. Coulis au choix : fraise, framboise, mangue, passion, lemon curd.",
    url: "/patisseries_americaines/cheese-cake-nature.html",
    allergenes: ["Fruits &agrave; coque", "Gluten", "Lactose", "&OElig;uf"],
    prix: ["24", "36", "52"]
  }
  
  @@cheese_cake_acidule = {
    name: "Cheese Cake acidul&eacute;",
    text: "Fond biscuit maison et cream cheese Philadelphia&reg; au citron vert et sa gel&eacute;e de pamplemousse.",
    url: "/patisseries_americaines/cheese-cake-acidule.html",
    prix: ["27", "40,50", "58,50"]
  }
  
  @@cheese_cake_fruits_rouges = {
    name: "Cheese Cake non cuit aux fruits rouges",
    text: "Fond biscuit maison aux flocons d'avoine et canneberges, cream cheese Philadelphia&reg; aux fruits rouges",
    url: "/patisseries_americaines/cheese-cake-fruits-rouges.html",
    prix: ["27", "40,50", "58,50"]
  }
  
  @@brownie = {
    name: "Brownie",
    text: "Brownie chocolat, &eacute;clats de noix et noisettes",
    url: "/patisseries_americaines/brownie.html",
    prix: ["20"]
  }
  
  @@lemon_square = {
    name: "Lemon square",
    text: "P&acirc;te sabl&eacute; et flan citron",
    url: "/patisseries_americaines/lemon-square.html",
    prix: ["20"]
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
