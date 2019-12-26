class SkillsController < ApplicationController

    before_action :set_find, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :authorize_headhunter#, only: [:create, :new, :update, :destroy, :edit]

    def index
      @skills = Skill.all
    end
    
    def new
      @skill = Skill.new
    end
    
    def show
    end

    def edit
      @skills = Skill.all
    end


    def create
      @skill = Skill.new(skill_params)
      if @skill.save
        flash[:notice] = 'Habilidade criada com sucesso'
        redirect_to @skill
      else
        flash[:alert] = 'Erro skill'
        render :new
      end
    end
    
    def update
      @skill = Skill.find(params[:id])
      if @skill.update(skill_params)
        redirect_to @skill
      else
        render :edit
      end
    end

    def destroy
      @skill.destroy
      redirect_to @skill, notice: "Habilidade excluida com sucesso"
    end


  private

    def skill_params
      params.require(:skill).permit(:name)
    end

    def set_find
      @skill = Skill.find(params[:id])
    end


end
  