Feature:
  As a medico
  I want to criar, deletar ou editar meu cadastro
  So that posso manter meu cadastro correto e atualizado

  Scenario: remover medico
    Given Estou na pagina index dos medicos
    And o medico de name 'Gabriel Melo de Menezes' cpf '129342224-03' email 'gabrielmelodemenezes@gmail.com' speciality 'Cardiologista' crm 'CRM/PE 123456' existe
    When eu aperto no botao para remover o medico de nome 'Gabriel Melo de Menezes'
    Then eu visualizo que o medico com nome 'Gabriel Melo de Menezes' foi removido com sucesso

  Scenario: cadastrar medico
    Given Estou no formulario de cadastro do medico
    And o medico de name 'Arthur Luis de Melo' cpf '123456789-10' email 'arthurtuteres@gmail.com' speciality 'Cardiologista' crm 'CRM/PE 123456' existe
    When eu aperto no botao para cadastrar o medico de nome 'Arthur Luis de Melo'
    Then eu visualizo que o cadastro com o name 'Arthur Luis de Melo' foi realizado com sucesso