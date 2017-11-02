Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :admin do
        get 'sessions/sign_in'
      end
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :admin do
        get 'sessions/sign_out'
      end
    end
  end

  resources :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
