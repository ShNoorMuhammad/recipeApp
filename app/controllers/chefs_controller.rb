class ChefsController < ApplicationController
    
    def index
        @chefs = Chef.paginate(page: params[:page], per_page: 5)
    end
    
    def new

        @chef = Chef.new

    end
    def create
        @chef = Chef.new(chef_params)
        if @chef.save
            flash[:success] = "Welcome #{@chef.chefname} to my recipe app"
            redirect_to chef_path(@chef)

        else
            render 'new'
        end

    end

    def show
        @chef = Chef.find(params[:id])
        @items = @chef.items
        @chef_items = @chef.items.paginate(page: params[:page], per_page: 5)
    end

    def edit
        @chef = Chef.find(params[:id])
    end

    def update
        @chef = Chef.find(params[:id])
        if @chef.update(chef_params)
            flash[:success] = "your info is edit succesfully"
            redirect_to chef_path
        else
            render 'edit'
        end
        
    end





    private


    def chef_params
        params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
    end


end