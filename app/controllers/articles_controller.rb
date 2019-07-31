class ArticlesController < ApplicationController
  def new
    @article = Article.new
  end

  def create
    #render plain: params[:article].inspect
    #@article = Article.new(params[:article])
    #@article = Article.new(params.require(:article).permit(:title, :text))
    @article = Article.new(article_params)
    #line 8 and 9 are equal
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy()
    redirect_to articles_path
  end


  def index
    @article_list = Article.all
  end

  def show
    @article =  Article.find(params[:id])
  end
  ## define ing private functions within the controller
  private
    def article_params
      params.require(:article).permit(:title, :text)
    end
end
