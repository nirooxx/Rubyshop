class ProductsController < ApplicationController

  def show
    @products = Product.all
  end

  def show_detail

    @details = Product.find(params[:id])
  end

  def add
   # Product.create(:name => "Product03", :product_number => "3", :price=>14.99)
   params.require :name
   params.require :price
   params.permit :name, :price, :product_number
   name = params[:name]
   price = params[:price]
   
   @create_product = Product.new
   @create_product.name = name
   @create_product.price = price
   @create_product.save
   @id = @create_product.id

    redirect_to products_show_path

  end

  def modify
    id = params[:id]
    price = params[:price]
    item = Product.find_by(:id=> id.to_i)

    item.price = price
    item.save
      
    redirect_to products_show_path

  end

  def delete
    
    @item = Product.find(params[:id])
    @item.destroy

    redirect_to products_show_path

  end
end
