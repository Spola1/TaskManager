Rails.application.routes.draw do
  root :to => "web/boards#show"
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  scope module: :web do
    resource :board, only: :show
    resource :session, only: [:new, :create, :destroy]
    resources :developers, only: [:new, :create]
    resource :password_resets, only: [:create, :update]
    resource :password, only: [:new, :edit]
  end

  namespace :admin do
    resources :users
  end

  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :tasks, only: [:index, :show, :create, :update, :destroy]
      resources :users, only: [:index, :show]
    end
  end
end
