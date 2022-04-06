Rails.application.routes.draw do

  get 'homes/top'
  root to:"homes#top"

　namespace :admin do
　 resources :records, only:[:index, :show, :destroy]
　 resources :comments, only:[:show, :destroy]
　end

　scope module: :user do
   resources :records
   resources :likes, only:[:create, :deestroy]
   resources :comments, only:[:create, :destroy]
   resources :searches, only:[:search]
  end
 end

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:passwords] ,controllers: {
    registrations: "admin/registrations",
    sessions: "admin/sessions"
  }

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
