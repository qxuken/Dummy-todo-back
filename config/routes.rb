Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: "/graphiql", graphql_path: "/graphql"
  end
  resources :tasks
  namespace :api, defaults: { format: :json } do
    resources :tasks
  end
  root to: 'tasks#index'
end
