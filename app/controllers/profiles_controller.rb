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
      @profile = profile.find(params[:id])
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
      params.require(:profile).permit(:name, :joblevel_id, :skill_id, :user_id)
    end

    def set_find
      @profile = Profile.find(params[:id])
    end


end
  