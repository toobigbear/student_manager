Rails.application.routes.draw do
    resources :students do
    resources :enrollments, only: [:new, :create]
  end

  resources :courses do
    resources :enrollments, only: [:new, :create]
  end

  resources :enrollments, only: [:index, :destroy]

  root "students#index"
end
