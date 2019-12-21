class JobsController < ApplicationController

  before_action :set_find, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :authorize_headhunter, only: [:create, :new, :update, :destroy, :edit]
  

    def index
      @jobs = Job.all
     
    end
    
    def new
      @job = Job.new
      @skills  = Skill.all
      @joblevels = Joblevel.all
      @companies = Company.all
      @benefits = Benefit.all
      @users = User.all
    end
    
    def show
      @skills  = Skill.all
      @joblevels = Joblevel.all
      @companies = Company.all
      @benefits = Benefit.all
      @users = User.all
    end

    def edit
      @jobs = Job.all
      @skills  = Skill.all
      @joblevels = Joblevel.all
      @companies = Company.all
      @benefits = Benefit.all
      @users = User.all
    end
    
    def create
      @job = Job.new(job_params)
      @job.email = current_user
      #@job.user_id = current_user
        if @job.save
          flash[:notice] = 'Vaga criada com sucesso.'
          redirect_to @job
        else
          @skills = Skill.all
          @joblevels = Joblevel.all
          @companies = Company.all
          @benefits = Benefit.all
          @users = User.all
          flash[:alert] = 'Erro jobs'
          render :new
        end
    end
    
    def update
      @job = Job.find(params[:id])

      if @job.update(job_params)
        redirect_to @job
      else
     
        render :edit
      end
    end

    def destroy
      
      @job.destroy
      redirect_to @job, notice: "Vaga excluida com sucesso"
    end

    def search
        
      #busca parcial em unico atributo
      #@jobs = Job.where('title like ?', "%#{params[:q]}%")

      #busca parcial em dois atributos(teste)
      @jobs = Job.where('title like ? OR description like ?', "%#{params[:q]}%", "%#{params[:q]}%")

      #Busca exata do termo pesquisado
      #@jobs = Job.where(title: params[:q])
      
      #busca um unico registro encontrado
      #@job = Job.find_by(title: params[:q])
      
      # exibe as pesquisa na index
      #render :index 
    end


private

  def job_params
    params.require(:job).permit(:title, :description, :end_date, 
                                :workplace, :salary_range, :company_id, 
                                :benefit_id, :joblevel_id, :skill_id, :user_id, :status)
  end

  def set_find
    @job = Job.find(params[:id])
  end


end
  