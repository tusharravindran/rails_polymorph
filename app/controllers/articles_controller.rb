class ArticlesController < ApplicationController

    before_action :authenticate_user!, only: [:new, :create, :edit, :update]
    def show
        @article = Article.find(params[:id])
        @comment = @article.comments
    end

    def index
      @articles = Article.order(created_at: :desc).page(params[:page]).per(5)
    end

    def new
      @article = Article.new
    end
  
    def create
      @article = current_user.articles.build(article_params)
      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render :new
      end
    end

  def edit
    @article = Article.find(params[:id])  # Find the article to edit
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end


private

def article_params
    params.require(:article).permit(:title, :content, :user_id)
end   
end
