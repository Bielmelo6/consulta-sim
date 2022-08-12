class Consultum < ApplicationRecord

  belongs_to :medico
  belongs_to :paciente

  validate :invalid_time
  validate :invalid_date

  def invalid_time
    if %w[07:00 08:00 09:00 10:00 11:00 12:00 14:00 15:00 16:00 17:00 18:00 19:00].exclude? time
      errors.add(:time, "O horário escolhido é fora do horário comercial!")
    end
  end

  def invalid_date
    if date.present? && date < Date.today
      errors.add(:date, "A consulta não pode ser realizada no passado!")
    end
  end
end