class ProfilesController < ApplicationController

    before_action :set_find, only: [:show, :edit, :update, :destroy]

    def index
      @profiles = Profile.all
    end
    
    def new
      
      @profile = Profile.new
      @skills = Skill.all
      @joblevels = Joblevel.all
      @users = User.all
    end
    
    def show
      
      @skills  = Skill.all
      @joblevels = Joblevel.all
      @users = User.all
    end

    def edit
      @profiles = Profile.all
      @skills  = Skill.all
      @joblevels = Joblevel.all
      @users = User.all
    end


    def create
      @profile = Profile.new(profile_params)
      @profile.email = current_user
      if @profile.save
        flash[:notice] = 'Perfil concluido com sucesso'
        redirect_to @profile
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
        render :edit
      end
    end

    def destroy
      @profile.destroy
      redirect_to @profile, notice: 'Perfil excluido com sucesso'
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
                                      :experience_end_date,:experience_current_position)
    end

    def set_find
      @profile = Profile.find(params[:id])
    end


end

