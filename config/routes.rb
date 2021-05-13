Rails.application.routes.draw do
  devise_for :users
  resources :items, only:[:edit, :index, :new, :show]
  root to: "items#index"
end
