Rails.application.routes.draw do

  root 'welcome#index'

  resources :boards, shallow: true do
    resources :lists, except: :index
  end

  resources :lists, except: [:index, :show, :new, :create, :edit, :update, :delete, :destroy, :delete], shallow: true do
    resources :cards, except: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
