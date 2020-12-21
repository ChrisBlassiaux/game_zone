Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  
    resources :avatars
    resources :news
    # pages statiques
    root 'static_pages#home'
    get 'static_pages/legal_notice'
    get 'static_pages/cgu_cgv'
    get 'static_pages/park_plan'
    get 'static_pages/my_game'
    get 'static_pages/contact'
    get 'static_pages/presse'
    
    get 'static_pages/go_to_the_park'
    get 'static_pages/pricings'
    get 'static_pages/calendar'
    
    get 'cards/show'

    # get 'users/show'
    get 'users/dashboard_admin'
    post 'users/add_participant'
    
    # pages dynamiques
    resources :parks, except: [:index, :show, :create, :new], path: 'gamezone'
    resources :news
    
    resources :attractions
    resources :items

    resources :order_items
    resource :carts, only:[:show]

    resources :charges

    devise_for :users
    match 'users/:id' => 'users#destroy', :via => :delete, :as => :admin_destroy_user
    resources :users, only: [:show, :edit, :update, :destroy]
  end
end
