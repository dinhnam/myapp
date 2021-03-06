Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    get 'new_releases', to: "static_pages#new"
    get 'top_view', to: "static_pages#top"
    get "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/signin", to: "sessions#login"
    post "/signin", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "/activation", to: "sessions#activation"
    get "/search", to: "search#index"
    get "/suggest", to: "search#suggest"
    resources :films, param: :pretty_param do
      resources :episodes, param: :number
    end
    resources :categories, param: :name
    resources :directors, param: :name
    resources :artists, param: :name
    resources :studios, param: :name
    resources :countries, param: :name
    resources :releases, param: :name
    resources :users, param: :name
  end
end
