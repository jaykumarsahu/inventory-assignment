Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: 'json' } do
    post 'sign_in', to: 'sessions#create'
    resources :products, except: %i[new edit create] do
      put :update_status, on: :member
    end
    resources :inventories, except: %i[new edit] do
      resources :products, only: %i[create]
    end

    resources :employees, except: %i[new edit]
  end
end
