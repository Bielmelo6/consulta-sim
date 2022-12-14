Given('Estou no formulario de cadastro do paciente') do
  visit 'pacientes/new'
  expect(page).to have_current_path('/pacientes/new')
end

When('eu preencho os campos name {string} birthday {string} cpf {string} email {string} city {string} neighborhood {string} street_avenue {string} complement {string} cep {string} e aperto no botao de cadastrar') do |name, birthday, cpf, email, city, neighborhood, street_avenue, complement, cep|
  fill_in 'paciente[name]', :with => name
  fill_in 'paciente[birthday]', :with => birthday
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[city]', :with =>city
  fill_in 'paciente[neighborhood]', :with => neighborhood
  fill_in 'paciente[street_avenue]', :with => street_avenue
  fill_in 'paciente[complement]', :with => complement
  fill_in 'paciente[cep]', :with => cep
  click_button 'Create Paciente'
end

Then('eu visualizo que o cadastro com o name {string} foi realizado com sucesso') do |name|
  expect(page).to have_content(name)
  expect(page).to have_current_path(pacientes_path + '/' +
                                      Paciente.last.id.to_s)
end

Given('Estou na pagina index dos pacientes') do
  visit 'pacientes'
  expect(page).to have_current_path('/pacientes')
end

And('o paciente de name {string} birthday {string} cpf {string} email {string} city {string} neighborhood {string} street_avenue {string} complement {string} cep {string} existe') do |name, birthday, cpf, email, city, neighborhood, street_avenue, complement, cep|
  visit 'pacientes/new'
  fill_in 'paciente[name]', :with => name
  fill_in 'paciente[birthday]', :with => birthday
  fill_in 'paciente[cpf]', :with => cpf
  fill_in 'paciente[email]', :with => email
  fill_in 'paciente[city]', :with =>city
  fill_in 'paciente[neighborhood]', :with => neighborhood
  fill_in 'paciente[street_avenue]', :with => street_avenue
  fill_in 'paciente[complement]', :with => complement
  fill_in 'paciente[cep]', :with => cep
  click_button 'Create Paciente'
  expect(page).to have_content(name)
end

When('eu aperto no botao para remover o paciente de nome {string}') do |name|
  expect(page).to have_content(name)
  click_button "Destroy this Paciente"
end

Then('eu visualizo que o paciente com nome {string} foi removido com sucesso') do |name|
  expect(page).to have_no_content(name)
  expect(page).to have_current_path('/pacientes')
end