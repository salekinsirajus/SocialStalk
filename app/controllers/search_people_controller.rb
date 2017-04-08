class SearchPeopleController < ApplicationController
    
    def search
      @users = User.all
      if params[:search]
        @users = User.search(params[:search]).order("created_at DESC")
      else
        @users = User.all.order("created_at DESC")
      end
    end

end
