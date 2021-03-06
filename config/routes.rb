Rails.application.routes.draw do
  get 'recipes' => 'recipes#index'
  resources :users, controller: "users" do
    resource :password,
      only: [:create, :edit, :update]
  end

	resources :pins do
	  member do
	    put 'like', to: 'pins#upvote'
	  end
	end
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

# these routes are for showing users a login form, logging them in, and logging them out.
get '/login' => 'sessions#new'
post '/login' => 'sessions#create'
get '/logout' => 'sessions#destroy'

get '/signup' => 'users#new'
post '/users' => 'users#create'
get '/users' => 'users#index'
get '/users' => 'users#show'

get '/pins' => 'pins#index'

root 'users#new'

get "/auth/:provider/callback" => "sessions#create_from_omniauth"

get '/search', to: 'pins#search', as: 'search'

end
