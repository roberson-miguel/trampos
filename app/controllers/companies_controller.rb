class CompaniesController < ApplicationController

    before_action :set_find, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :authorize_headhunter

    def index
      @companies = Company.all
    end
    
    def new
      @company = Company.new
    end
    
    def show
    end

    def edit
      @companies = Company.all
    end


    def create
      @company = Company.new(company_params)
      if @company.save
        flash[:notice] = 'Empresa criada com sucesso.'
        redirect_to @company
      else
        flash[:alert] = 'Erro'
        render :new
      end
    end
    
    def update
      @company = Company.find(params[:id])
      if @company.update(company_params)
        redirect_to @company
      else
        
        render :edit
      end
    end

    def destroy
      @company.destroy
      redirect_to @company, notice: "Empresa excluida com sucesso"
    end


  private

    def company_params
      params.require(:company).permit(:name,:cnpj,:address,:description)
    end

    def set_find
      @company = Company.find(params[:id])
    end


end
  