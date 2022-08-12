class Consultum < ApplicationRecord

  belongs_to :medico
  belongs_to :paciente

  validate :horario_invalido
  validate :data_invalida

  def horario_invalido
    if %w[07:00 8:00 9:00 10:00 11:00 12:00 13:00 14:00 15:00 16:00 17:00 18:00]. exclude? horario
      errors.add(:horario, "O horário escolhido está fora do nosso horário comercial!")
    end
  end

  def data_invalida
    if data.present? && data < Date.today
      errors.add(:data, "A consulta não pode ser realizada no passado!")
    end
  end
end