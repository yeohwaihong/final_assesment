Rails.application.routes.draw do
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

get '/pins' => 'pins#index'

root 'users#new'


end
