Rails.application.routes.draw do
  
  
  get 'orderitems/index'
  get 'orderitems/show'
  get 'orderitems/new'
  get 'orderitems/edit'
  get '/delete', to: 'order#delete'


  resources :orders do 
    resources:orderitems
  end
  
  get '/checkout' => 'cart#checkout'
  get 'orders/payment_confirmation/:id', to: 'orders#payment_confirmation'
  get '/sales', to: 'orders#sales'
  

  resources :categories
  resources :items do
    collection do
      get '/cart/:id', to: 'cart#add'
    end
    
    resources :reviews
    
  end
  get '/stockview', to: 'items#stockview'
  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  
  get 'category/:title', to: 'static_pages#category'
  
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  get '/cart', to: 'cart#index'
  get '/cart/:id', to: 'cart#add' , :as => :cart_add
  get '/clearcart' => 'cart#clear'
  get '/cart/remove/:id' => 'cart#remove'
  get '/cart/increase/:id' => 'cart#increase'
  get '/cart/decrease/:id' => 'cart#decrease'
  get '/items/addstock/:id' => 'items#add_stock', :as => :items_add_stock
  resources :users
  
  
  resources :account_activations, only: [:edit]
  
  get '/search' => 'items#search'
  
end
