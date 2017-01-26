Rails.application.routes.draw do
  namespace :v1 do
    resources :indexes, only: [:index, :create]
  end
end
