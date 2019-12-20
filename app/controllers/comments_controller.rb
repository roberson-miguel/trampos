class CommentsController < ApplicationController
  
    def index
        @profile = Profile.find(params[:profile_id])
        @comments = @profile.comments
    end
      
    def new
        @comment = Comment.new
    end
      
 
end
