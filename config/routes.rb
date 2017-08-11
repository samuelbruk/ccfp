Rails.application.routes.draw do

  root 'boards#index'
  
  resources :boards, shallow: true do
    resources :lists, except: :index
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
