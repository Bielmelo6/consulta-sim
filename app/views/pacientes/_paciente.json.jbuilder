json.extract! paciente, :id, :name, :birthday, :cpf, :email, :created_at, :updated_at
json.url paciente_url(paciente, format: :json)
