class PodcastsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :find_article, only: [:index]
  def index
    @podcasts = Podcast.all.order('date DESC')

    #guest = @podcast.guest
    authorize @podcasts
  end

  def show
    # @user = current_user
  end

  # def new
  #   @user = current_user
  #   @article = BlogArticle.new
  #   authorize @article
  # end

  # def create
  #   @article = BlogArticle.new(article_params)
  #   authorize @article
  #   @article.user = current_user
  #   @article.date = Time.now
  #   tag_list_raw = params[:blog_article][:tags].drop(1)
  #   @article.tag_list = tag_list_raw
  #   # @article.tag_list.add(:tags)
  #   if @article.save
  #       redirect_to blog_article_path(@article), notice: 'Article was successfully created.'
  #   else
  #       render 'new'
  #   end
  # end

  # def edit
  #   authorize @article
  # end

  # def update
  #   @article.update(article_params)
  #   authorize @article
  #   redirect_to blog_article_path(@article)
  # end

  # def destroy
  #   authorize @article
  #   @article.destroy
  #   redirect_to blog_articles_path
  # end

  private

  def article_params
    params.require(:podcast).permit(:title, :description, :small_description, :link, :date, :podcast_number, photos: [])
  end

  def find_podcast
    @podcast = Podcast.find(params[:id])
    authorize @podcast
  end

  def guest
    @guest = Guest.find(params[:id])
    authorize @podcast
  end

end
