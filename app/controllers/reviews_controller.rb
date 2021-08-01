class ReviewsController < ApplicationController
    def show
        @review=Review.find(params[:id])
    end

    def new
        @review=Review.new
        @product=Product.find(params[:product_id])
    end

    def create
        @product=Product.find(params[:product_id])
        @review=Review.new(review_params)
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
end
