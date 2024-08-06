class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    # THIS IS JUST FOR THE FORM
    @article = article.new
  end

  # DOES NOT HAVE A VIEW
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to article_path(@article)
    else
      # show the form again but with the @restaurant in this method
      render 'new', status: :unprocessable_entity
    end
  end

  private

  def article_params
    # whitelisting our form data -> only allowing what we want from the user
    params.require(:article).permit(:title, :content)
  end

end
