class ApplicationController < ActionController::Base
   def index
       @articles = Article.limit(10) 
  end
   def en   
  end
   def login
  end

  def logout
      session[:admin]=nil
      redirect_to '/'    
  end    

end
