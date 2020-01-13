class ProfilejobsController < ApplicationController

    before_action :set_find, only: [:index, :new, :create]
    before_action :authenticate_user!

    
    def index
        
        @profilejobs = @job.profilejobs
    end
      
    def new
    
        @profilejob = @job.profilejobs.new
    end
      
    def show
    end

    def search 
        @profilejobs = Profilejob.all
        @jobs = Job.all
        @profiles = Profile.all
        @users = User.all
        Profilejob.joins(:profile_id).where(profile_id: { profile_id: current_user.id})
    end

    def create
        @jobs = Job.all
        @profilejob = Profilejob.new(profilejob_params)
        @profilejob.profile_id = current_user.id
        @profilejob.job_id = @job.id
        @profiles = Profile.all
     
        if @profilejob.save!
            
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
