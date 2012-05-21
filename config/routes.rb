WeiboOauthRails::Engine.routes.draw do
  match '/auth/failure' => 'sessions#failure'

  match '/signout' => 'sessions#destroy', :as => :signout

  match '/signin' => 'sessions#new', :as => :signin

  match '/auth/:provider/callback' => 'sessions#create'  
end
