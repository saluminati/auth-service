Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    post 'signin' => 'user_token#create'
    post 'identify' => 'user#identify'
  end
end
