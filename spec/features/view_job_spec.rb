require "rails_helper"

feature 'View a job' do
  scenario "must de see a job" do

    Job.create(title:"Dev Ruby Jr", description:"Saber iniciar um projeto")

    visit root_path
    click_link "Vagas"
    click_link "Dev Ruby Jr"

    expect(page).to have_content('Dev Ruby Jr')
    expect(page).to have_content('Saber iniciar um projeto')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')

  end
end