Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    post 'signin' => 'user_token#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
