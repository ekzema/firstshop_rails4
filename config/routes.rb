Rails.application.routes.draw do
  get 'setting_pages/index'
  put 'setting_pages/update'
  get 'header_sites/index'
  put 'header_sites/update'
  mount RailsAdmin::Engine => '/adminpanel', as: 'rails_admin'
  get 'search/result'
  resources :sliders
  get 'admin_panel/index', as: 'admin_panel'
  put 'admin_panel/destroy', to: 'admin_panel#destroy' , as: 'destroy'
  get 'admin_panel/all_admins', as: 'all_admins'
  resources :orders

  devise_for :admins, controllers: { 
    sessions: "admins/sessions", 
    registrations: "admins/registrations",
    unlocks: "admins/unlocks",
    passwords: "admins/passwords",
    omniauth: "admins/omniauth",
    confirmations: "admins/confirmations"
     } do
  get '/admins/sign_out' => 'devise/sessions#destroy' 
  end

  devise_scope :admin do
    put "destroy_admins", to: "admins/registrations#destroy_admins"
    get "/admins" => "admins/sessions#new"
  end
  resources :line_items

  resources :carts

  root :to => 'catalogs#index'


resources :comments do
resources :comments
end
  resources :catalogs do
    collection do
    put 'delete_attachment'    
    get 'recommend'    
    end
  resources :boxes
end

resources :boxes do
  collection do
    put 'delete_attachment'
    end
  resources :brands
  resources :filtrs
end

resources :brands do
  collection do
    put 'delete_attachment'
  end
  resources :products
 
end

resources :products do
  get :who_bought, on: :member
  collection do
     put 'delete_attachment'
  end
  resources :specifications
  resources :comments
end
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
