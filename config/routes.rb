Rails.application.routes.draw do
  resources :widgets
  get 'show_me_rspec/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
