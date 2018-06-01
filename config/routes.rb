Rails.application.routes.draw do
  devise_for :applicants
  
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end

  get 'home/index'
  resources :tasks

  namespace :api, defaults: { format: :json } do
    resources :tasks
  end

  root to: 'home#index'
end
