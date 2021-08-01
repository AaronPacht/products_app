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
            redirect_to product_review_url(@review,@review)
        else
            render :new
        end
    end

    private
    def review_params
        params.require(:review).permit(:user,:stars,:message)
    end
end
