Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    resources :films
    resources :categories
    resources :directors
    resources :artists
    resources :studios
    resources :countries
    resources :users
  end
end
