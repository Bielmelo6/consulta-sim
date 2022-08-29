require "test_helper"

class PacienteTest < ActiveSupport::TestCase
  test 'Criando paciente com campos preenchidos corretamente' do
    paciente = Paciente.new name: 'Gabriel Melo', birthday: Date.parse("Dec 6 1999"),
                            cpf: '129342224-03', email: 'gabrielmelodemenezes@gmail.com'
    assert paciente.save
  end

  test 'Criando paciente com os campos do endereco preenchidos' do
    paciente = Paciente.new name: 'Gabriel Melo', birthday: Date.parse("Dec 6 1999"),
                            cpf: '129342224-03', email: 'gabrielmelodemenezes@gmail.com'
    endereco = Endereco.new city: 'Garanhuns', neighborhood: 'Boa Vista',
                            street_avenue: 'Rua dos Guararapes', complement: 'ap 7',
                            cep: '55000-00'
    endereco.paciente = paciente.id
    assert paciente.save
  end
  # test "the truth" do
  #   assert true
  # end
end
