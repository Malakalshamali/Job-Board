Rails.application.routes.draw do
  root to: 'home#index'

  devise_for :users

  resources :users do
    member do
      get :my_application
    end
  end

  resources :jobs do
    resources :job_applications do
      member do
        get :mark_as_seen
      end
    end
  end
end
