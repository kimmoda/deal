Deal::Application.routes.draw do

  root 'home#index'

  resources :offers do
    resources :charges
    resources :time_windows, only: [:show, :create] do
      member do
        get :time_remaining
      end
    end
  end

  resources :impressions
  resources :clicks
  resources :conversions
  
  resources :businesses do
    member do
      post :follow
      get :follow_data
    end
    collection do
      get :dashboard
    end
  end

  get '/dashboard' => "businesses#dashboard"

  get '/discover' => "businesses#index"

  post '/discover' => "businesses#create"

  get '/deals' => "offers#index"

  resources :customers 
  
  devise_for :users, :controllers => { omniauth_callbacks: "users/omniauth_callbacks", registrations: "registrations" }

  
  # devise_scope :user do
  #   get '/business/sign_up' => "devise/registrations#new"
  # end

  get '/business/sign_up' => "businesses#new"

  resources :users, only: 'show'


  patch '/users/edit'


  # post 'users/follow/:business_id' => 'users#follow', as: 'follow'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
