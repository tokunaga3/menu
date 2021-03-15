Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "user/:id", :to => "users/registrations#detail"
    get "signup", :to => "users/registrations#new"
    get "login", :to => "users/sessions#new"
    get "logout", :to => "users/sessions#destroy"
  end

  root "menu_lists#index"
  resources :menu_lists
  resources :families
end
