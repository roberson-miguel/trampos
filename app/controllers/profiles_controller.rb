class ProfilesController < ApplicationController

    before_action :set_find, only: [:show, :edit, :update, :destroy]

    def index
      @profiles = Profile.all
    end
    
    def new
      @profiles = Profile.new
    end
    
    def show
    end

    def edit
      @profiles = Profile.all
    end


    def create
      @profiles = Profile.new(profiles_params)
      if @profiles.save
        flash[:notice] = 'Habilidade criada com sucesso'
        redirect_to @profiles
      else
        flash[:alert] = 'Erro profiles'
        render :new
      end
    end
    
    def update
      @profiles = profiles.find(params[:id])
      if @profiles.update(profiles_params)
        redirect_to @profiles
      else
        #flash[:alert] = 'Você deve informar todos os dados da receita'
        render :edit
      end
    end

    def destroy
      @profiles.destroy
      redirect_to @profiles, notice: "Habilidade excluida com sucesso"
    end


  private

    def profiles_params
      params.require(:profiles).permit(:name)
    end

    def set_find
      @profiles = Profile.find(params[:id])
    end


end
  