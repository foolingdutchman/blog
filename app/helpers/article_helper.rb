module ArticleHelper

    def getIcon(article)
        if article.category =="share"
             "/img/t_info.png"
        elsif article.category=="mining"
             "/img/t_mining.png"
        else
             "/img/t_app.png"
        end
        
    end
end
