require "rails_helper"

feature 'Headhunter Create a new Job' do
  scenario "I can create a new job" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
   
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')
    
    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'

    click_link "Vagas"
    click_link "Nova vaga"

    fill_in 'Titulo', with: 'Dev Ruby Jr'
    fill_in 'Descrição', with: 'Saber inicar um CRUD e iniciar TDD'
    fill_in 'Encerra', with: '2020-01-15'
    fill_in 'Local de trabalho', with: 'Remoto'
    select '1000 Até 3000', from: 'Faixa salarial'
    select 'Ativa', from: 'Status Vaga'
    select "#{skill.name}", from: 'Habilidades'
    select "#{company.name}", from: 'Empresa'
    select "#{joblevel.name}", from: 'Nivel Vaga'
    select "#{benefit.name}", from: 'Beneficio'
    click_button 'Enviar'

    expect(page).to have_content('Vaga criada com sucesso.')
    expect(page).to have_content('Dev Ruby Jr')
    expect(page).to have_content('Saber inicar um CRUD e iniciar TDD')
    expect(page).to have_content('2020-01-15')
    expect(page).to have_content('Remoto')
    expect(page).to have_content('1000_até_3000')
    expect(page).to have_content('Ruby on Rails')
    expect(page).to have_content('Campus Code')
    expect(page).to have_content('Junior')
    expect(page).to have_content('Vale transporte')
    expect(page).to have_content('ativa')
  end

  scenario "Headhunter I can not create a new job empty" do

    skill = Skill.create!(name:'Ruby on Rails')
    joblevel = Joblevel.create!(name:'Junior')
    company = Company.create!(name: 'Campus Code', cnpj: '05.372.840/0001-07', address: 'Alameda Santos, 011', description: 'Consultoria e Treinamentos em tecnologia, especializada em Ruby on Rails')
    benefit = Benefit.create!(name:'Vale transporte')
    
    user = User.create!(email:'elaine@gmail.com', password:123123, role:'headhunter')


    visit root_path
    click_link "Entrar"

    fill_in 'Email', with: 'elaine@gmail.com'
    fill_in 'Password', with:123123
    click_button 'Log in'
  
    click_link "Vagas"
    click_link "Nova vaga"

    fill_in 'Titulo', with: ' '
    fill_in 'Descrição', with: ' '
    fill_in 'Encerra', with: ' '
    fill_in 'Local de trabalho', with: ' '
  
    click_button 'Enviar'

    expect(page).to have_content('...deve ser informado')
    
  end
end