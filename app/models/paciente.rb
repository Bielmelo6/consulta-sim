class Paciente < ApplicationRecord
  has_many :consultums
  has_many :medicos, through: :consultums
  has_one :endereco, dependent: :destroy
  accepts_nested_attributes_for :endereco, allow_destroy: true


  validates :name, presence:true, length: {in: 2..50}
  validates_format_of :cpf, with: /\A\d{9}-\d{2}\z/, presence: true,
                      message: 'Deve conter o seguinte formato: XXXXXXXXX-XX'
  validates :email, presence: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validate :nascimento_valido

  def nascimento_valido
    if birthday.present? && birthday > Date.today
      errors.add(:data, "Sua data de nascimento não pode ser no futuro!")
    end
  end
end