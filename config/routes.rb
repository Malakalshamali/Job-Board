Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :jobs do
    resources :job_applications do
    end
  end
end
