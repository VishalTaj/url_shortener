Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  concern :api_routes do
    resources :shorten, only: [:create, :show, :update]
  end

  scope module: 'api/v1', path: 'api/v1', defaults: { format: 'json', version: 'v1'}, as: 'api_v1' do
    concerns :api_routes
  end

  resources :shorten, only: [:show]

  # get '/:id' => 'shorten_urls#show', :constraints => { :id => /[A-Za-z0-9]+/ }
  root :to => "welcome#show"
end
