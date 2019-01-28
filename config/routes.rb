Rails.application.routes.draw do

  devise_for :doctors, controllers: {
    sessions: 'doctors/sessions',
    registrations: 'doctors/registrations',
    passwords: 'doctors/passwords' }
  devise_for :patients, controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations',
    passwords: 'patients/passwords' }

  get('home/index')
  root('home#index')

  resources :doctors

  resources :patients do
    resources :diagnoses
  end

  resource :mealplan
  resources :diets

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
