class SearchPeopleController < ApplicationController
    
    def search
      @users = User.all
      if params[:search_name]
        @users = User.searchName(params[:search_name]).order("created_at DESC")
      elsif params[:search_location]
        @users = User.searchLocation(params[:search_location]).order("created_at DESC")
      elsif params[:search_school_work]
        @users = User.searchSchoolWork(params[:search_school_work]).order("created_at DESC")
      elsif params[:search_interests]
        @users = User.searchInterests(params[:search_interests]).order("created_at DESC")
      else
        @users = User.all.order("created_at DESC")
      end
    end

end
