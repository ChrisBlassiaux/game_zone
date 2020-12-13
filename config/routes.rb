Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/legal_notice'
  get 'static_pages/cgu_cgv'
  get 'static_pages/visit_preparation'
  get 'static_pages/park_plan'
  get 'static_pages/my_game'
  get 'static_pages/contact'

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
