class ArticlesController < ApplicationController

        def index
            @articles=Article.all
        end

        def show
            @article=Article.find(params[:id])
        end
    
        def new 
            @article=Article.new
        end 
    
        def create
            @article=Article.new(article_params)
    
            if @article.save
                flash[:notice]= "article was created "
                redirect_to articles_path

            else
                render :new ,status: :unprocessable_entity
            end
        end

        def destroy
            @article=Article.find(params[:id])
            @article.destroy
            redirect_to articles_path
        end

        def update
            @article=Article.find(params[:id])

            @article.update(article_params)

            redirect_to article_path(@article)
        end

        def edit
            @article=Article.find(params[:id])
        end
    
        def article_params
            params.require(:article).permit(:title,:description)
        end
    
    
    
    
end
