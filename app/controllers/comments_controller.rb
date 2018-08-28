class CommentsController < ApplicationController

  # before_action :set_article
  # after_action -> { CommentRelayJob.perform_later(current_user) }

  http_basic_authenticate_with name: "dhh", password: "secret", only: :destroy

  def create

    @article = Article.find(params[:article_id])
    # @comment = Comment.create! body: params[:comment][:body][:user_id], article: @article

    
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end
 
  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end

  # private
  #   def set_article
  #     @article = Article.find(params[:article_id])
  #   end

  private
    def comment_params
      params.require(:comment).permit(:commenter, :body).merge(user_id: current_user.id)
    end
end
