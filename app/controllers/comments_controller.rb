class CommentsController < ApplicationController

    before_action :set_find, only: [:index, :new, :create]
  
    def index
        #@profile = Profile.find(params[:profile_id])
        @comments = @profile.comments
    end
      
    def new
        
        @comment = @profile.comments.new
    end
      
    def create
        @comment.name = current_user
        @comment = @profile.comments.new(comment_params)
        if @comment.save
            flash[:notice] = 'Comentario concluido com sucesso'
            redirect_to profile_comments_path(@profile)
        else 
            render :new
        end

    end

private

    def comment_params
        params.require(:comment).permit(:name, :comment, :rating)
    end
 
    def set_find
        @profile = Profile.find(params[:profile_id])
    end
end
