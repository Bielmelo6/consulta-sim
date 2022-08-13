class Endereco < ApplicationRecord

  belongs_to :paciente

  validates :city, presence: true, length: {in: 2..25}
  validates :neighborhood, presence: true, length: {in: 2..25}
  validates :street_avenue, presence: true, length: {in: 2..25}
  validates :complement, length: {maximum: 50}
  validates_format_of :cep, with: /\A\d{5}-\d{3}\z/, presence: true,
                      message: 'Deve conter o seguinte formato: XXXXX-XXX'

end