Given('Estou na pagina index dos medicos') do
  visit 'medicos'
  expect(page).to have_current_path('/medicos')
end

And('o medico de name {string} cpf {string} email {string} speciality {string} crm {string} existe') do |name, cpf, email, speciality, crm|
  visit 'medicos/new'
  fill_in 'medico[name]', :with => name
  fill_in 'medico[cpf]', :with => cpf
  fill_in 'medico[email]', :with => email
  fill_in 'medico[speciality]', :with => speciality
  fill_in 'medico[crm]', :with => crm
  click_button 'Create Medico'
  expect(page).to have_content(name)
end

When('eu aperto no botao para remover o medico de nome {string}') do |name|
  expect(page).to have_content(name)
  click_button "Destroy this medico"
end

Then('eu visualizo que o medico com nome {string} foi removido com sucesso') do |name|
  expect(page).to have_no_content(name)
  expect(page).to have_current_path('/medicos')
end

Given('Estou no formulario de cadastro do medico') do
  visit 'medicos/new'
  expect(page).to have_current_path('/medicos/new')
end

And('eu preencho os campos name {string} cpf {string} email {string} speciality {string} crm {string} e aperto no botao de cadastrar') do | name, cpf, email, speciality, crm|
  fill_in 'medico[name]', :with => name
  fill_in 'medico[cpf]', :with => cpf
  fill_in 'medico[email]', :with => email
  fill_in 'medico[speciality]', :with => speciality
  fill_in 'medico[crm]', :with => crm
  click_button 'Create Medico'
end

When('eu aperto no botao para cadastrar o medico de nome {string}') do |name|
  expect(page).to have_content(name)
  click_button "Create Medico"
end

Then('eu visualizo que o cadastro com o name {string} foi realizado com sucesso') do |name|
  expect(page).to have_content(name)
  expect(page).to have_current_path(medicos_path + '/' +
                                      Medico.last.id.to_s)
end