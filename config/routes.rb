Rails.application.routes.draw do
  get 'films/index'
  scope "(:locale)", locale: /en|vi/ do
    root "static_pages#home"
    resources :films
    resources :categories
    resources :directors
    resources :artists
    resources :studios
    resources :countries
  end
  
end
