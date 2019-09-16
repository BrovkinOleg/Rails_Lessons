Rails.application.routes.draw do

  root 'tests#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, shallow: true, except: :index do
      resources :answers, shallow: true
    end
  end

  # get '/tests/:test_id/questions/:id/del', to: 'questions#destroy'
  # post '/tests/:id/destroy', to: 'tests#destroy', as: :test_destroy
end