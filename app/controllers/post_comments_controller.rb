class PostCommentsController < ApplicationController
    def create
        post_image=PostImage.find(params[:post_image_id])
        comment=curent_user.post_comments.new(post_comment.params)
        comment.post_image_id=post_image.id
        comment.save
        redirect_to post_image_path(post_image)
    end
    
    def destroy
    end
    
    private
    def post_comment_params
        params.require(:post_comment).permit(comment)
    end
end