require "rails_helper"

feature 'Create new Company' do
  scenario "I can create a new company" do

    visit root_path
    click_link "Empresas"
    click_link "Nova empresa"

    fill_in 'Nome', with: 'Campus Code'
    fill_in 'CNPJ', with: '05.372.840/0001-07'
    fill_in 'Endereço', with: 'Alameda Santos, 011'
    fill_in 'Descrição', with: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails'
    
    click_button 'Enviar'

    expect(page).to have_content('Campus Code')
    expect(page).to have_content('05.372.840/0001-07')
    expect(page).to have_content('Alameda Santos, 011')
    expect(page).to have_content('Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    expect(page).to have_content('Empresa criada com sucesso.')

  end
end