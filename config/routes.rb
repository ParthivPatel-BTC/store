Rails.application.routes.draw do
  get '/start' => 'imports#start'

  # http MATCH for both GET and POST requests
  match '/import_csv', to: 'imports#import_csv', via: [:get, :post]

  # Generate GET for index action only
  resources :categories, only: :index do
  	# Generate GET for index and show actions only
  	# index - /categories/:category_id/products
  	# show - /categories/:category_id/products/:id
    resources :products, only: [:index, :show] do
    end
  end

  root to: 'categories#index'
end
