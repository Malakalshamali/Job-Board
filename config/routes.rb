Rails.application.routes.draw do
  # mount_devise_token_auth_for 'User', at: 'auth'
  root to: 'jobs#index'

  devise_for :users, path: 'auth',
                     path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }

  # devise_for :users

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
