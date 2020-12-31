class BlogArticlesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :find_article, only: [:show, :edit, :update, :destroy]
  def index
    @articles = BlogArticle.all
    authorize @articles
  end

  def show
    @user = current_user
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
    @article.date = Time.now
    if @article.save
        redirect_to blog_article_path(@article), notice: 'Article was successfully created.'
    else
        render 'new'
    end
  end

  def edit
    authorize @article
  end

  def update
    @article.update(article_params)
    authorize @article
    redirect_to blog_article_path(@article)
  end

  def destroy
    authorize @article
    @article.destroy
    redirect_to blog_articles_path
  end

  private

  def article_params
    params.require(:blog_article).permit(:title, :description, :rich_content, photos: [])
  end

  def find_article
    @article = BlogArticle.find(params[:id])
    authorize @article
  end
end
