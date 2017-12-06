Rails.application.routes.draw do
  resources :videos do
  	collection do 
  	 get :disliked
 		 get :liked
 		 get :myvideo
 	   get :tag
     get :search
     get :autocomplete
 	  end
 	  member do
  		resources :comments, only: :create
  	end
  	member do 
  		resources :like, only: :create
  		resources :dislike, only: :create
      resources :subscription,only: [:create,:destroy]
    end
  end

  devise_for :users ,:controllers => { :omniauth_callbacks => "omniauth_callbacks" } 
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'videos#index'
end
