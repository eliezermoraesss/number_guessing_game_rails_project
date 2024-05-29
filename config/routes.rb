# config/routes.rb
Rails.application.routes.draw do
  root 'game#index'
  post 'guess', to: 'game#guess'
  post 'reset', to: 'game#reset'
end
