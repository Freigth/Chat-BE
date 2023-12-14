Rails.application.routes.draw do
  namespace :api do
    resources :messages, only: [:new, :create, :show, :index]
  end

  mount ActionCable.server => '/cable'
end
