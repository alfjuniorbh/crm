Rails.application.routes.draw do
  get 'school_branches/index'
  resources :schools
end
