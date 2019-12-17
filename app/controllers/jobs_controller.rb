class JobsController < ApplicationController

  before_action :set_find, only: [:show, :edit, :update, :destroy]


    def index
      @jobs = Job.all
     
    end
    
    def new
      @job = Job.new
      @skills  = Skill.all
      @joblevels = Joblevel.all
      @companies = Company.all
      @benefits = Benefit.all
    end
    
    def show
      @skills  = Skill.all
      @joblevels = Joblevel.all
      @companies = Company.all
      @benefits = Benefit.all
    end

    def edit
      @jobs = Job.all
      @skills  = Skill.all
      @joblevels = Joblevel.all
      @companies = Company.all
      @benefits = Benefit.all
    end
    
    def create
      @job = Job.new(job_params)

      if @job.save
        flash[:notice] = 'Vaga criada com sucesso.'
        redirect_to @job
      else
        @skills  = Skill.all
        @joblevels = Joblevel.all
        @companies = Company.all
        @benefits = Benefit.all
        flash[:alert] = 'Erro jobs'
        render :new
      end
    end
    
    def update
      @job = Job.find(params[:id])

      if @job.update(job_params)
        redirect_to @job
      else
        #flash[:alert] = 'Você deve informar todos os dados da receita'
        render :edit
      end
    end

    def destroy
      
      @job.destroy
      redirect_to @job, notice: "Vaga excluida com sucesso"
    end



private

  def job_params
    params.require(:job).permit(:title, :description, :end_date, :workplace, :salary_range, :company_id, :benefit_id, :joblevel_id, :skill_id)
  end

  def set_find
    @job = Job.find(params[:id])
  end


end
  