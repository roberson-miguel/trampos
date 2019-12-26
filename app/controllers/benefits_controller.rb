class BenefitsController < ApplicationController

    before_action :set_find, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :authorize_headhunter#, only: [:create, :new, :update, :destroy, :edit]

    def index
      @benefits = Benefit.all
    end
    
    def new
      @benefit = Benefit.new
    end
    
    def show
    end

    def edit
      @benefits = Benefit.all
    end


    def create
      @benefit = Benefit.new(benefit_params)
      if @benefit.save
        flash[:notice] = 'Beneficio criado com sucesso'
        redirect_to @benefit
      else
        flash[:alert] = 'Erro'
        render :new
      end
    end
    
    def update
     
      if @benefit.update(benefit_params)
        redirect_to @benefit
      else
        
        render :edit
      end
    end

    def destroy
      @benefit.destroy
      redirect_to @benefit, notice: "Beneficio excluido com sucesso"
    end


  private

    def benefit_params
      params.require(:benefit).permit(:name)
    end

    def set_find
      @benefit = Benefit.find(params[:id])
    end


end
  