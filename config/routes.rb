Rails.application.routes.draw do

  root "homes#top"

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "users/registrations",
    sessions: 'users/sessions'
  }

  devise_for :admins, skip: [:passwords] ,controllers: {
    registrations: "admins/registrations",
    sessions: "admins/sessions"
  }

  scope module: :user do
    resources :records, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
    end
    resources :searches, only:[:search]
    get 'user/show'
  end

  namespace :admin do
    resources :records, only:[:index, :show, :destroy]
    resources :comments, only:[:index, :show, :destroy]
  end

end
