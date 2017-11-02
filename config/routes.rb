Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :admin do
        post 'sessions/sign_in'
        delete 'sessions/sign_out'
      end
    end
  end
  resources :admins
end
