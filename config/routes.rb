Rails.application.routes.draw do
  root 'game#index'
  post 'guess', to: 'game#guess'
end
