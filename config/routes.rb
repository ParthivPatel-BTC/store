Rails.application.routes.draw do
  get '/start' => 'imports#start'
  post '/import_csv' => 'imports#import_csv'
  
  resources :categories, only: :index do
    resources :products, only: [:index, :show] do
    end
  end

  root to: 'categories#index'
end
