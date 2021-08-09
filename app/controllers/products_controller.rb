class ProductsController < ApplicationController
    before_action :require_login, except: [:index]
    before_action :require_ownership, only: [:edit,:update,:destroy]
    before_action :require_seller, except: [:index,:show]

    def index
        @products=Product.all
    end

    def show
        @product=Product.find(params[:id])
        @reviews=@product.reviews
    end

    def new
        @product=Product.new
    end

    def create
        @product=Product.new(product_params)
        @product["user_id"]=current_user.id
        if @product.save
            redirect_to product_url(@product)
        else
            render :new
        end
    end

    def edit
        @product=Product.find(params[:id])
    end

    def update
        @product=Product.find(params[:id])
        if @product.update(product_params)
            redirect_to product_url(@product)
        else
            render :edit
        end
    end

    def destroy
        @product=Product.find(params[:id])
        @product.destroy
        redirect_to products_url
    end

    private
    def product_params
        params.require(:product).permit(:name,:price,:description,:url)
    end

    def require_login
        unless current_user
            flash[:alert]="You must be logged in to preform this action!"
            redirect_to new_session_url
        end
    end

    def require_ownership
        @product=Product.find(params[:id])
        unless @product.user_id==current_user.id
            flash[:alert]="You must be the owner of this product to perform this action"
            redirect_to root_url
        end
    end

    def require_seller
        unless current_user.seller==true
            flash[:alert]="You only have buyer access"
            redirect_to root_url
        end
    end
end
