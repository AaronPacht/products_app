class ReviewsController < ApplicationController
    before_action :require_ownership, only: [:edit,:update,:destroy]
    before_action :require_not_ownership, only: [:new,:create]
    
    def show
        @review=Review.find(params[:id])
        @author=User.find_by(id: @review.user_id)
    end

    def new
        @review=Review.new
        @product=Product.find(params[:product_id])
    end

    def create
        @product=Product.find(params[:product_id])
        @review=Review.new(review_params)
        @user=current_user
        @review[:user_id]=@user.id
        @review.product=@product
        if @review.save
            redirect_to product_review_url(@product,@review)
        else
            render :new
        end
    end

    def edit
        @product=Product.find(params[:product_id])
        @review=Review.find(params[:id])
    end

    def update
        @product=Product.find(params[:product_id])
        @review=Review.find(params[:id])
        if @review.update(review_params)
            redirect_to product_url(params[:product_id])
        else
            render :edit
        end
    end

    def destroy
        @review=Review.find(params[:id])
        @review.destroy
        redirect_to product_url(params[:product_id])
    end

    private
    def review_params
        params.require(:review).permit(:user,:stars,:message)
    end

    def require_ownership
        @review=Review.find(params[:id])
        unless @review.user_id==current_user.id
            flash[:alert]="You must be the owner of this review to perform this action"
            redirect_to product_url(@review.product_id)
        end
    end

    def require_not_ownership
        @product=Product.find(params[:product_id])
        if @product.user_id==current_user.id
            flash[:alert]="You can not review your own product"
            redirect_to product_url(@product)
        end
    end
end
