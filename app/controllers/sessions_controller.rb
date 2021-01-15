class SessionsController < ApplicationController

    def new 
       
    end 

    def create 
        @user = User.find_by(name: params[:user][:name])
        if @user 
            session[:user_id] = @user.id 
        # session[:user_id] = params[:user][:id]
            redirect_to user_path(@user) 
        # redirect_to user_path(User.find(params[:user][:id]))
        else 
            redirect_to :new 
        end 
    end 

    def destroy
        # if current_user 
        session.destroy   
        redirect_to root_path 
    end 

end 