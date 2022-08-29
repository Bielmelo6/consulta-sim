Feature:
  As a paciente
  I want to criar, deletar ou editar meu cadastro
  So that posso manter meu cadastro correto e atualizado

  Scenario: cadastrar paciente
    Given Estou no formulario de cadastro do paciente
    When eu preencho os campos name 'Gabriel Melo de Menezes' birthday '1999 12 06' cpf '129342224-03' email 'gabrielmelodemenezes@gmail.com' city 'Garanhuns' neighborhood 'Boa Vista' street_avenue 'Rua dos Guararapes' complement 'ap 7' cep '55000-00' e aperto no botao de cadastrar
    Then eu visualizo que o cadastro com o name 'Gabriel Melo de Menezes' foi realizado com sucesso