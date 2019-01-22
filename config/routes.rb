Rails.application.routes.draw do

  devise_for :doctors
  devise_for :patients

  get('home/index')
  root('home#index')

  resources :patients
  resource :doctors
  resource :mealplan

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
