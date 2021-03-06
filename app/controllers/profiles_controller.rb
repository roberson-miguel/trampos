class ProfilesController < ApplicationController

    before_action :set_find, only: [:show, :edit, :update, :destroy, :favorite]
    before_action :authenticate_user!
       

    def index
      @profiles = Profile.all
      @jobs = Job.all
    end
    
    def new
      @profile = Profile.new
      @skills = Skill.all
      @joblevels = Joblevel.all
      @users = User.all
      @jobs = Job.all
    end
    
    def show
      @comments = Comment.all
      @skills  = Skill.all
      @joblevels = Joblevel.all
      @users = User.all
    end

    def edit
      @skills  = Skill.all
      @joblevels = Joblevel.all
      @users = User.all
      
    end


    def create
      @profile = Profile.new(profile_params)
      @profile.email = current_user.email
      @jobs = Job.all
      if @profile.save
        current_user.andamento!
        flash[:notice] = 'Perfil concluido com sucesso'
        redirect_to @profile
        ProfilesMailer.welcome(@profile.id)        
      else
        @skills = Skill.all
        @joblevels = Joblevel.all
        @users = User.all
        flash[:alert] = 'Erro profiles'
        render :new
      end
    end
    
    def update
      @profile = Profile.find(params[:id])
      if @profile.update(profile_params)
        redirect_to @profile
      else
        @skills = Skill.all
        @joblevels = Joblevel.all
        @users = User.all
        render :edit
      end
    end

    def destroy
      @profile.destroy
      redirect_to @profile, notice: 'Perfil excluido com sucesso'
    end

    def search
       @profiles = Profile.where("education_course LIKE ? OR experience_reponsibility LIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    end

    def favorite
      type = params[:type]
        if type == "favorite"
          current_user.favorites << @profile
          redirect_back fallback_location: root_path, notice: "Voce favoritou #{@profile.name}"
        elsif type == "unfavorite"
          current_user.favorites.delete(@profile)
          redirect_back fallback_location: root_path, notice: "Desfavoritado #{@profile.name}"
        else
          redirect_back fallback_location: root_path, notice: "Nada modificado"
        end
    end

  private

    def profile_params
      params.require(:profile).permit(:name, :email, :social_name, :joblevel_id, :skill_id, 
                                      :user_id, :languages, :address, :cellphone,
                                      :date_birth, :languages, :education_level,
                                      :education_status, :education_institution,
                                      :education_course, :education_end_date,
                                      :experience_company, :experience_reponsibility,
                                      :experience_role, :experience_start_date,
                                      :experience_end_date,:experience_current_position, :avatar, :job_id)
    end

    def set_find
         @profile = Profile.find(params[:id])
    end

end

