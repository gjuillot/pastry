class ProductsController < ApplicationController
  
  def index
    @products = type_class.where("published = ?", true).all
  end
  
  def show
    @product = type_class.find(params[:id])
    if (not @product.published) and (current_user.nil? or current_user.id != 1)
      redirect_to @@forbidden
      return
    end
    @recommandations = [] #TODO
  end
  
  def create
    if (current_user.nil? or current_user.id != 1)
      redirect_to @@forbidden
    else
      @product = Product.new(params[:product])
      @product.save
      redirect_to "/admin/products"
    end
  end

  def update
    if (current_user.nil? or current_user.id != 1)
      redirect_to @@forbidden
    else
      @product = Product.find(params[:id])
      @product.update_attributes(product_params)
      redirect_to @product
    end
  end
  
  def destroy
    if (current_user.nil? or current_user.id != 1)
      redirect_to @@forbidden
    else
      @product = Product.find(params[:id])
      @product.destroy
      redirect_to "/admin/products"
    end
  end

  def generate_tartes
    if (current_user.nil? or current_user.id != 1)
      redirect_to @@forbidden
      return
    end
    @produits = [
      @@tarte_citron,
      @@tarte_orange_passion,
      @@tarte_rhubarbe_fraise,
      @@tarte_agrumes,
      @@tarte_automne,
      @@tarte_marron_myrtille
    ]
    @produits.each do |p|
      generate_tarte(p)
    end
  end
    
  private
  
  def generate_tarte(p)
    tarte = Tarte.new
    tarte.name = p[:name]
    tarte.description = p[:text]
    tarte.allergenes = "Fruits à coque, Gluten, Lactose, &OElig;uf"
    tarte.published = true
    tarte.save
    
    price = ProductPrice.new
    price.product_id = tarte.id
    price.text = "Individuel"
    price.price = 3.80
    price.save
    price = ProductPrice.new
    price.product_id = tarte.id
    price.text = "6 personnes"
    price.price = p[:prix][0]
    price.save
    price = ProductPrice.new
    price.product_id = tarte.id
    price.text = "8-10 personnes"
    price.price = p[:prix][1]
    price.save
    price = ProductPrice.new
    price.product_id = tarte.id
    price.text = "12-14 personnes"
    price.price = p[:prix][2]
    price.save
    
    unless p[:images].nil?
      image = ProductImage.new
      image.product_id = tarte.id
      image.usage = "main"
      image.url = p[:images][0]
      image.save
      image = ProductImage.new
      image.product_id = tarte.id
      image.usage = "zoom"
      image.url = p[:zoom]
      image.save
      (1..(p[:images].size-1)).each do |i|
        image = ProductImage.new
        image.product_id = tarte.id
        image.usage = "other"
        image.url = p[:images][i]
        image.save
      end
    end
  end
  
  def type 
      Product.types.include?(params[:type]) ? params[:type] : "Product"
  end

  def type_class 
      type.constantize 
  end
  
  def product_params
    return params[params[:type]]
  end
end
