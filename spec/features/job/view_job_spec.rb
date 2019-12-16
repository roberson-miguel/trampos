require "rails_helper"

feature 'View a job' do
  scenario "must de see a job" do

    Job.create(title:"Dev Ruby Jr", description:"Saber iniciar um Crud", end_date:'2020-01-31', workplace:'Remoto', salary_range: '1000_até_3000')

    visit root_path
    click_link "Vagas"
    click_link "Dev Ruby Jr"

    expect(page).to have_content('Dev Ruby Jr')
    expect(page).to have_content('Saber iniciar um Crud')
    expect(page).to have_content('2020-01-31')
    expect(page).to have_content('Remoto')
    expect(page).to have_content('1000_até_3000')
    expect(page).to have_link('Voltar')
    expect(page).to have_link('Editar')
    expect(page).to have_link('Deletar')
  end
end