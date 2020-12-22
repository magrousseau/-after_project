class BlogArticlesController < ApplicationController
  def index
    @articles = BlogArticle.all
    authorize @articles
  end

  def show
    @article = BlogArticle.new(article_params)
    authorizee @article
  end

  private

  def article_params
    strong_params = params.require(:blog_articles).permit(:title, :description, :content, :date)
  end
end
