require "test_helper"

class ConsultumTest < ActiveSupport::TestCase
  test 'Criando consulta sem o preenchimento dos campos' do
    consulta = Consultum.new
    assert_not consulta.save
  end

  test 'Criando consulta com campos validos' do
    paciente = Paciente.new name: 'Gabriel Melo', birthday: DateTime.now,
                            cpf: '1293422274-03', email: 'gabrielmelodemenezes@gmail.com'
    assert paciente.save
    medico = Medico.new name: 'Arthur Luís', cpf: '123456789-10', email: 'arthurtuteres@gmail.com',
                        speciality: 'Ortopedista', crm: 'CRM/PE 123456'
    assert medico.save
    consulta = Consultum.new date: DateTime.now, time: '15:00', paciente_id: paciente.id, medico_id: medico.id
    assert consulta.save
  end
  # test "the truth" do
  #   assert true
  # end
end
