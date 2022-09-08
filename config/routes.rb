Rails.application.routes.draw do
  devise_for :admins, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  devise_for :users, skip: [:passwords], controllers: {
  registrations: "user/registrations",
  sessions: 'user/sessions'
}

  scope module: :users do
    root:to => "homes#top"
    resources :chats, only: [:show, :index, :create]
    resources :posts do
     resources :post_comments, only: [:create, :destroy]
     resource :bookmarks, only: [:create, :destroy]
    end
    get "/users/unsubscribe" => "users#unsubscribe"
    resources :users, omly: [:show, :edit, :update, :destroy] do
      resource :favorites, only: [:create, :destroy]
    end
    post "/users/guest_sign_in" => "users#guest_sign_in"
    get "/posts/searches" => "posts#searches"
    get "/users/notifications" => "users#notifications"
  end

   namespace :admin do
     get "/" => "homes#top"
     resources :users, only: [:index, :show, :update]
     resources :posts, only: [:index, :destroy]
     resources :post_comments, only: [:index, :destroy]
     get "/admin/posts/searches" => "posts#searches"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
