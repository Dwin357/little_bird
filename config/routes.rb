Rails.application.routes.draw do
  resources :user, except: [:index]
end
