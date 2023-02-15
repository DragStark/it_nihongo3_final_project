Rails.application.routes.draw do
  
  devise_for :authors
    
  get 'authors/show'
  
  get 'home/index'
  
  
  devise_scope :author do
    authenticated :author do
     root to: 'home#index', as: :authenticated_root
    end

    unauthenticated do
     root to: 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  scope module: 'authors' do
    resources :posts do
      resources :comments
      resources :likes
      resources :elements do
        member do
          patch :move
        end
      end
      get :show
    end
  end
  
end
