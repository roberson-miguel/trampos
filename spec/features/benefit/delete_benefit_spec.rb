require "rails_helper"

feature 'Deleting a Benefit' do
  scenario "I can delete a benefit" do

    Benefit.create(name:'Vale transporte')

    visit root_path
    click_link "Beneficios"
    click_link "Vale transporte"
    click_link "Deletar"

      
    expect(page).to have_content('Beneficio excluido com sucesso')

  end
end