Rails.application.routes.draw do
  get 'static_pages/home'
  get 'static_pages/coming_soon'
  get 'static_pages/register'

  root "static_pages#coming_soon"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
