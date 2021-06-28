Rails.application.routes.draw do

  root to: 'public/homes#top'

  namespace :admin do
    resources :items,       except: [:destroy]
    resources :genres,      only: [:index, :create, :edit, :update]
    resources :customers,   only: [:index, :show, :edit, :update]
    resources :orders,      only: [:show, :update]
    resources :order_items, only: [:update]
  end

  scope module: :public do
    resources :items,       only: [:index, :show]
    resources :cart_items,  only: [:index, :update, :create]
      patch '/cart_items/:id'         => 'cart_items#destroy'
      patch '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :orders,      only: [:new, :index, :show]
      post '/orders/confirm' => 'orders#confirm'
      get  '/orders/thanks'  => 'orders#thanks'
      post '/orders/decide'  => 'orders#decide'
    resources :adresses,    except: [:new, :show]
    #customersのルーティング
    get '/customers/my_page'     => 'customers#show'
    get '/customers/edit'        => 'customers#edit'
    patch '/customers'           => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/withdraw'  => 'customers#withdraw'
  end

  devise_for :admins, skip: :all
  devise_scope :admin do
    get '/admin/sign_in'     => 'admin/sessions#new',     as: :new_admin_session
    post '/admin/sign_in'    => 'admin/sessions#create',  as: :admin_session
    delete '/admin/sign_out' => 'admin/sessions#destroy', as: :destroy_admin_session
  end

  devise_for :customers, skip: :all
  devise_scope :customer do
    get '/customers/sign_in'     => 'public/sessions#new',         as: :new_customer_session
    post '/customers/sign_in'    => 'public/sessions#create',      as: :customer_session
    delete '/customers/sign_out' => 'public/sessions#destroy',     as: :destroy_customer_session
    get '/customers/sign_up'     => 'public/registrations#new',    as: :new_customer_registration
    post '/customers'            => 'public/registrations#create', as: :customer_registration
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/admin' => 'admin/homes#top'
  get '/about' => 'public/homes#about'

end
