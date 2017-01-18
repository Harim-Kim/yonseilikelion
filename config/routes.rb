Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  get "home/index"
  get "home/excel"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
