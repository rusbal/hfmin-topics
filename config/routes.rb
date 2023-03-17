Rails.application.routes.draw do
  root "static#index"

  resources :books, only: :index
end
