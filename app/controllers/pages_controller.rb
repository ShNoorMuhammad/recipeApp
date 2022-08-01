class PagesController < ApplicationController

    def home
        
        redirect_to items_path if logged_in?
        
    end

end