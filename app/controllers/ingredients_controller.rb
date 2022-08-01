class IngredientsController < ApplicationController

    before_action :require_admin , except: [:show, :index]
    def index
    
        @ingredients = Ingredient.paginate(page: params[:page], per_page: 5)
    
    
    end
    
    def new
        @ingredient = Ingredient.new

    end
     
    def create
        @ingredient = Ingredient.new(ingredient_params)
        if @ingredient.save
            flash[:success]= "Ingredient added successfully"
            redirect_to ingredient_path(@ingredient)
        else
            render 'new'

        end


    end

    def edit
        @ingredient = Ingredient.find(params[:id])
    end


    def update
        @ingredient = Ingredient.find(params[:id])
        if @ingredient.update(ingredient_params)
            flash[:success] = "Ingredient updated successfully"
            redirect_to @ingredient
        else
            redner 'edit'
        end
    end

    def show
        @ingredient = Ingredient.find(params[:id])
        @items = @ingredient.items
        @ingredeint_items = @ingredient.items.paginate(page: params[:page], per_page: 5)

    end


   
    private
    def ingredient_params
        params.require(:ingredient).permit(:name)
    end

    def require_admin
        if !logged_in? ||(logged_in? and !current_chef.admin?)
            flash[:danger] = "only admin can perform this action"
            redirect_to ingredients_path


        end
    end

   
end
