Rails.application.routes.draw do
　root to:"homes#top"

  # 会員用
  # URL /users/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "user/registrations",
    sessions: 'user/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admins, skip: [:passwords] ,controllers: {
    registrations: "admins/registrations",
    sessions: "admins/sessions"
  }

  namespace :admin do
　 resources :records, only:[:index, :show, :destroy]
　 resources :comments, only:[:show, :destroy]
　end

  namespace :user do
   resources :records, only:[:new, :create, :index, :show, :edit, :update, :destroy]
   resources :likes, only:[:create, :deestroy]
   resources :comments, only:[:create, :destroy]
   resources :searches, only:[:search]
  end
end
end
