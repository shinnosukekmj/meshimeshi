Rails.application.routes.draw do
  devise_for :users
  root'homes#top'
  get'about/homes'=>'homes#about',as: 'about'
  resources:post_images,only: [:new,:create,:inedx,:show,:destroy]do
      resources:post_comments,only: [:new,:create,:destroy]
      resource:favorites,only: [:create,:destroy]
  end
  resources:users,only: [:show,:edit,:update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
