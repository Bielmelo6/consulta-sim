require "test_helper"

class ConsultumTest < ActiveSupport::TestCase
  test 'Criando consulta sem o preenchimento dos campos' do
    consulta = Consultum.new
    assert_not consulta.save
  end

  test 'Criando consulta com campos validos' do
    paciente = Paciente.new name: 'Gabriel Melo de Menezes', birthday: Date.parse("Dec 6 1999"),
                            cpf: '129342224-03', email: 'gabrielmelodemenezes@gmail.com'
    assert paciente.save
    medico = Medico.new name: 'Arthur Luís', cpf: '123456789-10', email: 'arthurtuteres@gmail.com',
                        speciality: 'Ortopedista', crm: 'CRM/PE 123456'
    assert medico.save
    consulta = Consultum.new date: Date.parse("Sep 12 2022"), time: '15:00', paciente_id: paciente.id, medico_id: medico.id
    assert consulta.save
  end

  test 'Criando consulta com os campos do medico preenchidos errado' do
    paciente = Paciente.new name: 'Gabriel Melo de Menezes', birthday: Date.parse("Dec 6 1999"),
                            cpf: '129342224-03', email: 'gabrielmelodemenezes@gmail.com'
    assert paciente.save
    medico = Medico.new name: 'Arthur Luís', cpf: '123', email: 'arthurtuteres',
                        speciality: 'Ortopedista', crm: 'CRM/PE 12'
    assert_not medico.save
    consulta = Consultum.new date: Date.parse("Sep 12 2022"), time: '15:00', paciente_id: paciente.id, medico_id: medico.id
    assert_not consulta.save
  end

  test 'Criando consulta com os campos do paciente preenchidos errado' do
    paciente = Paciente.new name: 'Gabriel Melo de Menezes', birthday: Date.parse("Dec 6 1999"),
                            cpf: '12', email: 'gabriel'
    assert_not paciente.save
    medico = Medico.new name: 'Arthur Luís', cpf: '123456789-10', email: 'arthurtuteres@gmail.com',
                        speciality: 'Ortopedista', crm: 'CRM/PE 123456'
    assert medico.save
    consulta = Consultum.new date: Date.parse("Sep 12 2022"), time: '15:00', paciente_id: paciente.id, medico_id: medico.id
    assert_not consulta.save
  end
  # test "the truth" do
  #   assert true
  # end
end
