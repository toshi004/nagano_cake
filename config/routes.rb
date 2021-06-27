Rails.application.routes.draw do

  root to: 'public/homes#top'

  namespace :admin do
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end

  namespace :public do
  end

  devise_for :admins, skip: :all
  devise_scope :admin do
    get '/admin/sign_in' => 'admin/sessions#new', as: :new_admin_session
    post '/admin/sign_in' => 'admin/sessions#create', as: :admin_session
    delete '/admin/sign_out' => 'admin/sessions#destroy', as: :destroy_admin_session
  end

  devise_for :customers, skip: :all
  devise_scope :customer do
    get '/customers/sign_in' => 'public/sessions#new', as: :new_customer_session
    post '/customers/sign_in' => 'public/sessions#create', as: :customer_session
    delete '/customers/sign_out' => 'public/sessions#destroy', as: :destroy_customer_session
    get '/customers/sign_up' => 'public/registrations#new', as: :new_customer_registration
    get '/customers/my_page' => 'public/customers#show'
    get '/customers/edit' => 'public/customers#edit'
    patch '/customers' => 'public/customers#update'
    get '/customers/unsubscribe' => 'public/customers#unsubscribe'
    patch '/customers/withdraw' => 'public/customers#withdraw'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/admin' => 'admin/homes#top'
  get '/about' => 'public/homes#about'

end
