Rubyconf::Application.routes.draw do
  devise_for :users
  resources :tickets
  resources :attendees
  
  match 'flows/results', :controller => :flows, :action => 'results'
  match 'flows/confirmation', :controller => :flows, :action => 'confirmation'
  match 'flows/retry', :controller => :flows, :action => 'retry'
  match 'flows/register', :controller => :flows, :action => 'register'
  match 'flows/registered', :controller => :flows, :action => 'registered'
  match 'flows/index', :controller => :flows, :action => 'index'
  resources :flows

  root :to => 'tickets#index'
end
