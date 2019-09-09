Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root 'tests#show'

  resources :tests do
    resource :questions
  end

  get '/tests/:test_id/questions/:question_id', to: 'questions#show_the_question'
end