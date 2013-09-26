Tapermail::Application.routes.draw do

  get "app/help"
  get "app/version"
  get "app/tour"
  get "dl/:token" => 'downloads#show', as: 'download'

  get '/what' => 'welcome#what', as: 'what'
  get '/how' => 'welcome#how', as: 'how'
  get '/feedback' => 'welcome#feedback'

  devise_for :admin_users, ActiveAdmin::Devise.config

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

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

  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :greylists, only: [:index]
      resources :app_logs, only: [:create, :index, :show]
    end
  end

  root 'welcome#index'

  ActiveAdmin.routes(self)
end
