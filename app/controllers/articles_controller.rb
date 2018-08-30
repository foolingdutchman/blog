class ArticlesController < ApplicationController
     before_action :set_article, only: [:show, :destroy,:edit,:update ]
    def create
        if session[:admin]
            @article = Article.new(article_params)
            @admin=  Admin.find_by id: session[:admin]    
            @article.author = @admin.alias
            respond_to do |format|
                if @article.save
                    format.html do
                        if request.xhr?
                            render json: { article: @article }
                        else
                           redirect_to(@article, notice: 'article was successfully created.') and return 
                        end
                    end
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
         if session[:admin]
            @articles = Article.all 
        else
            session[:from]='/articles/new'
            redirect_to '/login' 
        end
       
    end

    def mining
        @articles = Article.order(updated_at: :desc).where(category: 'mining')
    end

    def share
         @articles = Article.order(updated_at: :desc).where(category: 'share')
    end

    def dapp
         @articles = Article.order(updated_at: :desc).where(category: 'dapp')
    end

    def new
        if session[:admin]
           @article=Article.new  
        else
            session[:from]='/articles/new'
            redirect_to '/login' 
        end

       
    end

    def show    
    end

    # DELETE /articles/1
  # DELETE /articles/1.json
   def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Aritcle was successfully destroyed.' }
      format.json { head :no_content }
    end
   end
   # GET /articles/1/edit
  def edit
  end
  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(user_params)
        format.html { redirect_to @article, notice: 'article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :category,:body,:summary)
    end
end
