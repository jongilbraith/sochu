Rails.application.routes.draw do

  root to: 'pages#home'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/signout' => 'sessions#destroy', :as => :signout

end
