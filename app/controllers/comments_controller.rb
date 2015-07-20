class CommentsController < ApplicationController
before_action :authenticate_admin!, except: [:create]
  def create
    @comment = find_commentable
    @commentable = @comment.comments.new(comment_params)
    if @commentable.save
      redirect_to request.referer + '#commentTitle'
    else
      redirect_to request.referer + '#commentTitle', alert: 'Не все поля были заполнены!'
    end
  end


def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back 
end

private

	def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end

  def comment_params
      params.require(:comment).permit(:body, :name, :commentable_id, :commentable_typ)
  end

end

