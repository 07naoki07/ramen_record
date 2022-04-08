Rails.application.routes.draw do

  root "homes#top"
  
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }
  
  devise_for :admins, skip: [:passwords] ,controllers: {
    registrations: "admins/registrations",
    sessions: "admins/sessions"
  }
  
  namespace :user do
    resources :records, only:[:new, :create, :index, :show, :edit, :update, :destroy]
    resources :likes, only:[:create, :deestroy]
    resources :comments, only:[:create, :destroy]
    resources :searches, only:[:search]
  end
  
  namespace :admin do
    resources :records, only:[:index, :show, :destroy]
    resources :comments, only:[:index, :show, :destroy]
  end

end
