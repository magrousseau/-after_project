class BlogArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show]
  def index
    @articles = BlogArticle.all
    authorize @articles
  end

  def show
  end

  def new
    @user = current_user
    @article = BlogArticle.new
    authorize @article
  end

  def create
    @article = BlogArticle.new(article_params)
    authorize @article
    @article.user = current_user
    @article.date = DateTime.now
    if @article.save
        redirect_to blog_article_path(@article)
    else
        render 'new'
    end
  end

  private

  def article_params
    params.require(:blog_article).permit(:title, :description, :content, photos: [])
  end

  def find_article
    @article = BlogArticle.find(params[:id])
    authorize @article
  end
end
