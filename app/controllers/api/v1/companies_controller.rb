class Api::V1::CompaniesController < Api::V1::ApiController
    def show
        @company = Company.find(params[:id])
        render json: @company
    end

    def index
        @companies = Company.all
        render json: @companies
    end
end