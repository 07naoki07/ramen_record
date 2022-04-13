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
    resources :ramen_shops, only:[:create, :index, :edit, :update]
    resources :records, only:[:new, :create, :index, :show, :edit, :update, :destroy] do
    resource :likes, only:[:create, :destroy]
    resources :comments, only:[:create, :destroy]
    end
    resources :searches, only:[:search]
    resources :user, only:[:show] do
     resource :relationships, only: [:create, :destroy]
      get 'followings' => 'relationships#followings', as: 'followings'
      get 'followers' => 'relationships#followers', as: 'followers'
    end
  end

  namespace :admin do
    resources :records, only:[:index, :show, :destroy]
    resources :comments, only:[:index, :show, :destroy]
  end

end
