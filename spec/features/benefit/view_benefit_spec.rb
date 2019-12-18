require "rails_helper"

feature 'View a Benefit' do
  scenario "I can see a benefit" do

    Benefit.create(name:'Vale transporte')

    visit root_path
    click_link "Beneficios"
    click_link "Vale transporte"
      
    expect(page).to have_content('Vale transporte')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  
  end
end