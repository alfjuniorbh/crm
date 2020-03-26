Rails.application.routes.draw do
  devise_for :devise_schools
  get 'school_branches/index'
  resources :schools
end
