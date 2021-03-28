Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users, only: [:edit, :update]
  #↓roomsの中でしか行われないアクションだからネストにする（チャットルームに入らないと行えないアクション）
  resources :rooms, only: [:new, :create] do
    resources :messages, only: [:index, :create]
  end
end
