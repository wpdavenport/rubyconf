Rubyconf::Application.routes.draw do
  get "pingone/error"
  devise_for :users
  resources :tickets
  resources :attendees
  
  get 'flows/results', :controller => :flows, :action => 'results'
  get 'flows/confirmation', :controller => :flows, :action => 'confirmation'
  get 'flows/retry', :controller => :flows, :action => 'retry'
  get 'flows/registered', :controller => :flows, :action => 'registered'
  post 'flows/register', :controller => :flows, :action => 'register'
  resources :flows

  namespace :sso do
    get "pingone/error" => "pingone#error"
    post 'pingone', to: "pingone#create"
  end

  root :to => 'flows#index'
end
