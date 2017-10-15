Rails.application.routes.draw do

  get 'sessions/new'

  get 'sessions/create'

  get 'dashboard/index'
  get 'dashboard/feeder'
  get 'dashboard/ruby_one'
  get 'dashboard/ruby_two'
  get 'dashboard/ruby_three'
  get 'dashboard/ruby_four'
  get 'dashboard/transfer-funds', to: "dashboard#funds_transfer"
  get 'dashboard/deposit-funds', to: "dashboard#deposit_funds"
  get 'dashboard/account-statement', to: "dashboard#account_statement"

  get 'static_pages/home'
  get 'static_pages/coming_soon'
  get 'static_pages/register'

  resources :users

  resources :sessions

  root "static_pages#register"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
