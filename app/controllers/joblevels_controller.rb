class JoblevelsController < ApplicationController

    before_action :set_find, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
    before_action :authorize_headhunter
    
    def index
      @joblevels = Joblevel.all
    end
    
    def new
      @joblevel = Joblevel.new
    end
    
    def show
    end

    def edit
      @joblevels = Joblevel.all
    end


    def create
      @joblevel = Joblevel.new(joblevel_params)
      if @joblevel.save
        flash[:notice] = 'Nivel da vaga criado com sucesso'
        redirect_to @joblevel
      else
        flash[:alert] = 'Erro'
        render :new
      end
    end
    
    def update
     
      if @joblevel.update(joblevel_params)
        redirect_to @joblevel
      else
     
        render :edit
      end
    end

    def destroy
      @joblevel.destroy
      redirect_to @joblevel, notice: "Nivel da vaga excluido com sucesso"
    end


  private

    def joblevel_params
      params.require(:joblevel).permit(:name)
    end

    def set_find
      @joblevel = Joblevel.find(params[:id])
    end


end
  