class ProfilejobsController < ApplicationController

    before_action :set_find, only: [:index, :new, :create, :show]
    before_action :authenticate_user!
    
    def index
        
        @profilejobs = @job.profilejobs
    end
      
    def new
    
        @profilejob = @job.profilejobs.new
    end
      
    def create
      
        @profiles = Profile.all
        @jobs = Job.all
        @profilejob = Profilejob.new(profilejob_params)
        @profilejob.profile_id = current_user
        @profilejob.job_id = @job.id
        if @profilejob.save
            flash[:notice] = 'Aplicado para vaga com sucesso'
            redirect_to job_profilejobs_path(@job)
        else 
            render :new
        end

    end

private

    def profilejob_params
        params.require(:profilejob).permit(:profile_id, :job_id, :comment)
    end
 
    def set_find
        @job = Job.find(params[:job_id])
      
    end
end
