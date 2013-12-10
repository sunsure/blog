class ArticlesController < ApplicationController
  load_and_authorize_resource except: [:create]
  authorize_resource only: [:create]

  def index
    @articles = @articles.page(params[:page]).per(params[:per_page])
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @article = Article.new(safe_params)

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(safe_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_url, notice: 'Article was successfully removed.'
  end

  private

  def safe_params
    safe_attrbutes = [:title, :permalink, :excerpt, :content, :published_at]
    params.require(:article).permit(safe_attrbutes)
  end

end
