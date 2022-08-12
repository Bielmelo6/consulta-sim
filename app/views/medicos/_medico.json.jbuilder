json.extract! medico, :id, :name, :birthday, :cpf, :email, :crm, :speciality, :created_at, :updated_at
json.url medico_url(medico, format: :json)
