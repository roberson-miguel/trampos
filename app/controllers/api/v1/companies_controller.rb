class Api::V1::CompaniesController < Api::V1::ApiController
    def show
        @company = Company.find(params[:id])
        render json: @company
    end

    def index
        @companies = Company.all
        render json: @companies
    end

    def create
        @company = Company.new(params.permit(%i[name address cnpj description]))
        if @company.valid?
           @company.save!
           render json: @company, status: 201
        else 
           render json: 'error', status: 412 
        end
    end

    def update
        @company = Company.find(params[:id])
        if @company.update(params.permit(%i[name address cnpj description]))
          render json: @company, status: 200
        else 
          render json: 'error', status: 412 
        end
    end
end