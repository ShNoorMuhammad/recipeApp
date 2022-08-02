class ChefsController < ApplicationController
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:destroy]

  def index
    @chefs = Chef.paginate(page: params[:page], per_page: 5)
  end

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      session[:chef_id] = @chef.id
      flash[:success] = "Welcome #{@chef.chefname} to my recipe app"
      redirect_to chef_path(@chef)
    else
      render "new"
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
      render "edit"
    end
  end

  def destroy
    if !chef.admin?
      @chef = Chef.find(params[:id])
      @chef.destroy
      flash[:danger] = "Chef and its recipes are deleted"
      redirect_to chefs_path
    end
  end

  private

  def chef_params
    params.require(:chef).permit(:chefname, :email, :password, :password_confirmation)
  end

  def require_same_user
    if current_chef != @chef
      flash[:danger] = "you can only edit your own info"
      redirect_to chefs_path
    end
  end

  def require_admin
    if logged_in? and !current_chef.admin?
      flash[:danger] = "only admin can delete the profiles"
      redirect_to root_path
    end
  end
end
