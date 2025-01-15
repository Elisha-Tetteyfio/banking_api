Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "no_auth#homepage"
  post "/auth/login", to: "auth#login"
  get "/clients/:id", to: "clients#show"
  post "/clients", to: "clients#create"
  post "/create_account", to: "accounts#create"
  get "/account_types", to: "accounts#account_types"
end
