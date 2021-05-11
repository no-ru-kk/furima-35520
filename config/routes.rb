Rails.application.routes.draw do
  resources :item, only:[:edit, :index, :new, :show]
  root to: "items#index"
end
