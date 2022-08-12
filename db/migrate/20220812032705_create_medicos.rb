class CreateMedicos < ActiveRecord::Migration[7.0]
  def change
    create_table :medicos do |t|
      t.string :name
      t.date :birthday
      t.string :cpf
      t.string :email
      t.string :crm
      t.string :speciality

      t.timestamps
    end
  end
end
