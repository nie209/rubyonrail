class CommentsController < ApplicationController
  def create
    # this will allow you find the article that you currently in
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to  article_path(@article)
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
