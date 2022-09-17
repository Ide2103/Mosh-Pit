Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'relationships/followings'
  get 'relationships/followers'
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}
  devise_scope :user do
    post "/users/guest_sign_in" => "user/sessions#guest_sign_in"
  end

  scope module: :user do
    root "homes#top"
    resources :chats, only: [:show, :index, :create]
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
      resource :bookmarks, only: [:create, :destroy]
    end
    get "/users/unsubscribe" => "users#unsubscribe"
    resources :users, only: [:show, :edit, :update, :destroy, :index] do
      resource :favorites, only: [:create, :destroy]
      resource :relationships, only: [:create, :destroy]
  	get 'followings' => 'relationships#followings', as: 'followings'
  	get 'followers' => 'relationships#followers', as: 'followers'
    end
    get "/users/notifications" => "users#notifications"
  end

   namespace :admin do
     get "/" => "homes#top"
     resources :users, only: [:index, :show, :update]
     resources :posts, only: [:index, :destroy]
     resources :post_comments, only: [:index, :destroy]
     get "/admin/posts/searches" => "posts#searches"
  end

  get "/search" => "searches#search"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
