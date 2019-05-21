class ApplicationController < ActionController::Base
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      render :new # this is the view!
      # render new.html.erb
    end
  end

  def edit
    @article.destroy
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path
    else
      render :edit # show the edit view
      # render edit.html.erb
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def article_params
    params.require(:article).permit(:title, :content)
  end

  def set_article
    @article = Article.find(params[:id])
  end
end
