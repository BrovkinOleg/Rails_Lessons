Rails.application.routes.draw do

  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  # get 'sessions/new'
  # get 'users/new'

  delete :logout, to: 'sessions#destroy'

  resources :tests, only: :index do
    resources :questions, except: :index, shallow: true do
      resources :answers, except: :index, shallow: true
    end
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    get :result, on: :member
  end

  namespace :admin do
    resources :tests
  end
end
