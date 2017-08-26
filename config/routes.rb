Rails.application.routes.draw do

  root 'welcome#index'
  post '/checklists/:id/toggle', to: 'checklists#toggle'

  resources :boards, shallow: true do
    resources :lists, except: :index
  end

  resources :lists, only: [], shallow: true do
    resources :cards, except: :index
  end

  resources :cards, only: [], shallow: true do
    resources :checklists, except: :index
  end

  resources :cards, only: [], shallow: true do
    resources :comments, only: [:create, :destroy]
  end

  resources :users, only: :create
  resource :session, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
