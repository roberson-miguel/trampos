class SkillsController < ApplicationController

    before_action :set_find, only: [:show, :edit, :update, :destroy]

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
        flash[:alert] = 'Erro'
        render :new
      end
    end
    
    def update
      @skill = Skill.find(params[:id])
      if @skill.update(skill_params)
        redirect_to @skill
      else
        flash[:alert] = 'Você deve informar todos os dados da receita'
        render :edit
      end
    end

    def destroy
      @skill.destroy
      redirect_to @skill, notice: "Habilidade excluida com sucesso"
    end


  private

    def skill_params
      params.require(:skill).permit(:name,:cnpj,:address,:description)
    end

    def set_find
      @skill = Skill.find(params[:id])
    end


end
  