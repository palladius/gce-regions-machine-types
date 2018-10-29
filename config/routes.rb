Rails.application.routes.draw do
  resources :machine_types
  get 'welcome/index'
  get 'welcome/about'
  get 'welcome/license'
  resources :gce_zones
  resources :gce_regions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :just_routes

  resources :gce_regions do
    resources :gce_zones
  end

end
