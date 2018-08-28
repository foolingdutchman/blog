class ArticlesController < ApplicationController
     before_action :set_article, only: [:show]
    def create
        if session[:admin]
            @article = Article.new(article_params)
            @admin=  Admin.find_by id: session[:admin]    
            @article.author = @admin.alias
            respond_to do |format|
                if @article.save
                    format.html { redirect_to @article, notice: 'article was successfully created.' }
                    format.json { render :show, status: :created, location: @article } 
                else
                    format.html { render :new }
                    format.json { render json: @article.errors, status: :unprocessable_entity }
                end
            end
        else
            session[:from]='/articles/new'
            redirect_to '/login'     
        end
    end

    def index
        

    end
    def new
        @article=Article.new
    end

    def show    
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
