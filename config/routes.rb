Rails.application.routes.draw do

  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    password: 'secret',
    confirmation: 'verification',
    unlock: 'unblock',
    registration: 'register',
    sign_up: 'cmon_let_me_in'
  }

  root 'home#index'

  # root action for home controller
  get 'secret',   to: 'home#secret'
  get 'sidebar',  to: 'home#sidebar'


  #error routes
  get "/404", to: "errors#not_found" 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
