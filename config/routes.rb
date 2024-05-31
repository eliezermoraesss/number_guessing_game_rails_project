# config/routes.rb
Rails.application.routes.draw do
  # Definindo a rota raiz ("/")
  root 'game#index'

  # Rota para checar o status de saúde da aplicação
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Rotas do controlador 'game'
  post 'guess', to: 'game#guess'
  post 'reset', to: 'game#reset'
end
