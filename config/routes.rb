Rubyconf::Application.routes.draw do
  devise_for :users
  resources :tickets
  resources :attendees
  
  get 'flows/results', :controller => :flows, :action => 'results'
  get 'flows/confirmation', :controller => :flows, :action => 'confirmation'
  get 'flows/retry', :controller => :flows, :action => 'retry'
  get 'flows/register', :controller => :flows, :action => 'register'
  get 'flows/registered', :controller => :flows, :action => 'registered'
  get 'flows/index', :controller => :flows, :action => 'index'
  resources :flows

  root :to => 'tickets#index'
end
