Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
  end
  resources :films
  resources :categories
  resources :directors
  resources :actors
  resources :studios
end
