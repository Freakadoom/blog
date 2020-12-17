class ArticlesController < ApplicationController
  http_basic_authenticate_with name: "pavel", password: "lol", except: [:index, :show]

  def index
    @articles = Article.all
  end

  def show
    @article = Article.find_by(slug: params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  def edit
    @article = Article.find_by(slug: params[:id])
  end

  def update
    @article = Article.find_by(slug: params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  def destroy
    @article = Article.find_by(slug: params[:id])
    @article.destroy

    redirect_to root_path
  end

  private
    def article_params
      params.require(:article).permit(:title, :body, :slug)
    end
end