class SessionsController < ApplicationController

    def new

    end

    def create
        chef = Chef.find_by(email: params[:session][:email].downcase)
        if chef && chef.authenticate(params[:session][:password])
            session[:chef_id] = chef.id
            redirect_to chef
        else
            flash.now[:danger]= "invalid email or password enter"
            render 'new'
        end

    end

    def destroy
        session[:chef_id] = nil
        flash[:success] = "you have logged out"
        redirect_to root_path

    end


end
