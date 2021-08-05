class SessionsController < ApplicationController
    def new
    end

    def create
        @user=User.find_by(username:params[:session][:username])
        if @user && @user.authenticate(params[:session][:password])
            session[:user_id]=@user.id
            flash[:notice]="You are now logged in"
            redirect_to root_url
        else
            render :new
        end
    end

    def destroy
        session[:user_id]=nil
        redirect_to root_url
    end
end
