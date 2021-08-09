class UsersController < ApplicationController
    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if user_params[:seller].to_i==1
            @user["seller"]=true
        else
            @user["seller"]=false
        end
        if @user.save
            session[:user_id]=@user.id
            flash[:notice]="You are now signed up"
            redirect_to root_url
        else
            render :new
        end
    end

    private
    def user_params
        params.require(:user).permit(:username,:password,:password_confirmation,:seller)
    end
end
