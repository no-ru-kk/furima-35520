Rails.application.routes.draw do
  devise_for :users
  resources :item, only:[:edit, :index, :new, :show]
  root to: "items#index"
end
