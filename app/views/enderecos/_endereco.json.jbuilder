json.extract! endereco, :id, :city, :neighborhood, :street_avenue, :complement, :cep, :paciente_id, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)
