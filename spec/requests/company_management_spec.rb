require 'rails_helper'

describe 'Comapany Management' do
    context 'Show' do

        it 'Render Company Correctly' do
            company = Company.create(name: 'Campus Code', cnpj: '05.372.840/0001-07', 
                                     address: 'Alameda Santos, 011', 
                                     description: 'Consultoria e Treinamentos')

            get api_v1_company_path(company)
            json = JSON.parse(response.body, symbolize_names: true)
    
            expect(response).to have_http_status(:ok)
            expect(json[:name]).to eq(company.name)
            expect(json[:cnpj]).to eq(company.cnpj)
            expect(json[:address]).to eq(company.address)
            expect(json[:description]).to eq(company.description)
        end

        it 'Company not found' do
            
            get api_v1_company_path(id: 999)
            
            expect(response).to have_http_status(:not_found)
        end

    end
end