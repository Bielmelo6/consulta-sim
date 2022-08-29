require "test_helper"

class MedicoTest < ActiveSupport::TestCase
  test 'Criando medico com campos preenchidos corretamente' do
    medico = Medico.new name: 'Gabriel Melo', cpf: '129342224-03', email: 'gabrielmelodemenezes@gmail.com',
                        speciality: 'Cardiologista', crm: 'CRM/PE 123456'
    assert medico.save
  end

  test 'Criando medico com o campo crm invalido' do
    medico = Medico.new name: 'Gabriel Melo', cpf: '129342224-03', email: 'gabrielmelodemenezes@gmail.com',
                        speciality: 'Cardiologista', crm: 'CRMPE 12'
    assert_not medico.save
  end

  test 'Criando medico com o campo cpf invalido' do
    medico = Medico.new name: 'Gabriel Melo', cpf: '12', email: 'gabrielmelodemenezes@gmail.com',
                        speciality: 'Cardiologista', crm: 'CRM/PE 123456'
    assert_not medico.save
  end

  test 'Criando medico sem os campos preenchidos' do
    medico = Medico.new
    assert_not medico.save
  end
  # test "the truth" do
  #   assert true
  # end
end