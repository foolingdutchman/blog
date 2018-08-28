class AdminController < ApplicationController

    def login
     @Admin=  Admin.find_by name: params[:name]
     if @Admin.password== params[:password]
        session[:admin]=@Admin.id
        redirect_to '/users'
     else 
        redirect_to '/login' 
     end
         
    end
end
