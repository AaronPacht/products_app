class ProductsController < ApplicationController
    def index
        @products=Product.all
    end

    def show
        @product=Product.find(params[:id])
        @reviews=Review.where(product_id: params[:id])
    end
end
