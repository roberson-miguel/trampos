require "rails_helper"

feature 'delete a jobs' do
  scenario "..I must delete a job" do

    Job.create(title:"Dev Ruby Jr", description:"Saber iniciar um Crud")

    visit root_path
    click_link "Vagas"
    click_link "Dev Ruby Jr"
    click_link "Deletar"

    expect(page).to have_content('Vaga excluida com sucesso')
  end
end