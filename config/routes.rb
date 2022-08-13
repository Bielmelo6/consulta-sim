Rails.application.routes.draw do

  resources :consulta
  resources :medicos
  resources :pacientes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root to: "inicial#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
