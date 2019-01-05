Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/signin", to: "sessions#login"
    post "/signin", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/activation", to: "sessions#activation"
    resources :films, param: :pretty do
      resources :episodes, param: :number
    end
    resources :categories
    resources :directors
    resources :artists
    resources :studios
    resources :countries
    resources :users
  end
end
