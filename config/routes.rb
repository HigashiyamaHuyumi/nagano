Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...

  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  
  namespace :public do
    resources :customers, only: [:show, :edit, :update] # 顧客リソース用のルートを追加
  end

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
  get '/about', to: 'homes#about', as: 'home_about' #aboutページルート
end
