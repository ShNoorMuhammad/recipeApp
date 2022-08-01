class ItemsController < ApplicationController

    before_action :require_user , except: [:index , :show]
    before_action :require_same_user , only: [:edit, :update, :destroy]

    def index
        @items = Item.paginate(page: params[:page], per_page: 5)
    end
    def show
        @item = Item.find(params[:id])
    end

    def new
        @item = Item.new
    end


    def create
        @item = Item.new(item_params)
        
        @item.chef = current_chef
        if @item.save
            flash[:success] = "Recipe added succesfully"
            redirect_to item_path(@item)
        else
            render 'new'
        end
    end

    def edit
        @item = Item.find(params[:id])
    end


    def update
        @item = Item.find(params[:id])
        if @item.update(item_params)
            flash[:success] = "Recipe edit succesfully"
            redirect_to item_path(@item)
        else
            render 'edit'

        end
    end

    def destroy
        @item = Item.find(params[:id])
        @item.destroy
        flash[:success] = "Deleted sucessfully"
        redirect_to items_path
        # Item.find(params[:id]).destroy
        # flash[:success] = "Deleted sucessfully"
        # redirect_to items_path


    end










    private
    def item_params
        params.require(:item).permit(:name , :description)

    end
    def require_same_user
        if current_chef != @item.chef and !current_chef.admin?
            flash[:danger] = "you can only edit your recipes"
            redirect_to items_path
        end

    end


end
