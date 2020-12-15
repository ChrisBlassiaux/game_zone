Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    resources :avatars
    resources :news
    # pages statiques
    root 'static_pages#home'
    get 'static_pages/legal_notice'
    get 'static_pages/cgu_cgv'
    get 'static_pages/visit_preparation'
    get 'static_pages/park_plan'
    get 'static_pages/my_game'
    get 'static_pages/contact'

    # get 'users/show'
    get 'users/dashboard_admin'
    post 'users/add_participant'
    
    # pages dynamiques
    resources :parks, except: [:index, :create, :new], path: 'gamezone'
    resources :news, except: :index
    
    resources :attractions
    resources :items

    devise_for :users
    resources :users, only: [:show, :edit, :update]

  end
end
