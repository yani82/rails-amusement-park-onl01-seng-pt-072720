class UsersController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:new, :create]

    def new 
        @user = User.new 
    end 

    def create 
        @user = User.new(user_params)
        if @user.save 
            session[:user_id] = @user.id 
            # flash[:notice] = "Welcome to the theme park!"
            redirect_to @user
            # redirect_to user_path(@user), :alert => "You Just Signed Up"
        else 
            # redirect_to new_user_path 
            render 'new' #, :alert => "Please Fill In All Forms"
        end 
    end 

    def show 
        @user = User.find_by(id: params[:id])
    end 

    # def edit 
    #     @user = User.find(params[:id])
    # end 

    # def update 
    #     @user = User.find(params[:id])
    #     if @user.update(user_params)
    #         redirect_to user_path(@user), :alert => "You Just Updated Your User Account"
    #     else 
    #         render 'edit', :alert => "Please Fill In All Forms" 
    #     end 
    # end 

    def ride 
        @ride = Ride.new(user_id: current_user.id, attraction_id: params[:format])
        message = @ride.take_ride
        redirect_to user_path(current_user), flash: { message: message }
    end 

    private 

    def user_params
        params.require(:user).permit(:name, :password, :height, :happiness, :nausea, :tickets, :admin)
    end 

    def require_login
        redirect_to :root unless session.include? :user_id
    end

end 