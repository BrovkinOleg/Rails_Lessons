Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tests do
    resources :questions, shallow: true
  end

  # get '/tests/:test_id/questions/:id/del', to: 'questions#destroy'
  # post '/tests/:id/destroy', to: 'tests#destroy', as: :test_destroy
end