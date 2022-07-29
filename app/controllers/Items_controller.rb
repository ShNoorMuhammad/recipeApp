class ItemsController < ApplicationController

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
        @item.chef = Chef.first
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

        def destroy
            @item = Item.find(params[:id])
            @item.destroy
            flash[:success] = "Deleted sucessfully"
            redirect_to items_path
            # Item.find(params[:id]).destroy
            # flash[:success] = "Deleted sucessfully"
            # redirect_to items_path

    
        end




    end






    private
    def item_params
        params.require(:item).permit(:name , :description)

    end


end
