Rails.application.routes.draw do
  get 'import/create'
  resources :users, only: :index do
    collection { resource :import, only: :create, controller: :import }
  end
end
