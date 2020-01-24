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

    context 'Index' do

        it 'Render companies correctly' do
          company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', 
                                     address: 'Alameda Santos, 011', 
                                     description: 'Consultoria e Treinamentos')
          company1 = Company.create!(name: 'Bios Bug', cnpj: '04.456.878/0001-56', 
                                    address: 'Rua Tito, 011', 
                                    description: 'SoftHouse e Consultoria Ltda')

          get api_v1_companies_path

          json = JSON.parse(response.body, symbolize_names: true)
    
          expect(response).to have_http_status(:ok)

          expect(json[0][:name]).to eq(company.name)
          expect(json[0][:cnpj]).to eq(company.cnpj)
          expect(json[0][:address]).to eq(company.address)
          expect(json[0][:description]).to eq(company.description)

          expect(json[1][:name]).to eq(company1.name)
          expect(json[1][:cnpj]).to eq(company1.cnpj)
          expect(json[1][:address]).to eq(company1.address)
          expect(json[1][:description]).to eq(company1.description)
        end
    end 

    context 'Create' do
        it 'Create a company correctly' do
                   
          post api_v1_companies_path, params: {name: 'Bios Bug', cnpj: '00.456.878/0001-56', 
                                               address: 'Rua Tito, 011', 
                                               description: 'SoftHouse e Consultoria Ltda'}
          
          json = JSON.parse(response.body, symbolize_names: true)
            
          expect(response).to have_http_status(201)

          expect(json[:name]).to eq('Bios Bug')
          expect(json[:cnpj]).to eq('00.456.878/0001-56')
          expect(json[:address]).to eq('Rua Tito, 011')
          expect(json[:description]).to eq('SoftHouse e Consultoria Ltda')

          company = Company.last
          expect(company.cnpj).to eq('00.456.878/0001-56')
    
        end
    end

end