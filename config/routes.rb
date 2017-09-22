Rails.application.routes.draw do

  root 'welcome#index'
  post '/checklists/:id/toggle', to: 'checklists#toggle'
  post '/cards/:id/add_label', to: 'cards#add_label', as: 'cards_add_label'
  post 'cards/:id/add_due_date', to: 'cards#add_due_date', as: 'cards_add_due_date'
  post 'cards/:id/add_card_attachment', to: 'cards#add_card_attachment', as: 'cards_add_card_attachment'

  get 'users/search', to: 'users#search', as: 'search_user'

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

  resources :users, only: :create do
    member do
      get :confirm_email
    end
  end

  resources :relationships, only: [:create, :destroy]

  resource :session, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
