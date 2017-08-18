Rails.application.routes.draw do

  root 'welcome#index'

  resources :boards, shallow: true do
    resources :lists, except: :index
  end

  resources :lists, only: [], shallow: true do
    resources :cards, except: :index
  end

  resources :users, only: :create
  resources :sessions, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
