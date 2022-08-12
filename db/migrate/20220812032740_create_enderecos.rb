class CreateEnderecos < ActiveRecord::Migration[7.0]
  def change
    create_table :enderecos do |t|
      t.string :city
      t.string :neighborhood
      t.string :street_avenue
      t.string :complement
      t.string :cep
      t.references :paciente, null: false, foreign_key: true

      t.timestamps
    end
  end
end
