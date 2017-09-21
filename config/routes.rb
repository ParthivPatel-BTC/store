Rails.application.routes.draw do
  get '/start' => 'imports#start'
  match '/import_csv', to: 'imports#import_csv', via: [:get, :post]

  resources :categories, only: :index do
    resources :products, only: [:index, :show] do
    end
  end

  root to: 'categories#index'
end
