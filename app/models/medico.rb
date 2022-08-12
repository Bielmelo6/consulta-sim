class Medico < ApplicationRecord

  has_many :consultums
  has_many :pacientes, through: :consultums

  validates_format_of :crm, with: /\A\w{3}\W{1}\w{2}\s\d{6}\z/, presence: true,
                      message: 'Deve conter o seguinte formato: CRM/PE XXXXXX'
  validates_format_of :cpf, with: /\A\d{9}-\d{2}\z/, presence: true,
                      message: 'Deve conter o seguinte formato: XXXXXXXXX-XX'
  validates :name, presence: true, length: {in: 2..50}
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :speciality, presence: true, length: {in: 2..50}
  validate :nascimento_valido

  def nascimento_valido
    if birthday.present? && birthday > Date.today
      errors.add(:data, "Sua data de nascimento não pode ser no futuro!")
    end
  end
end