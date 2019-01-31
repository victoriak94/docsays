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
    resources :diagnoses do
      resources :diets
    end
  end

  resources :recipes
  post '/search' => 'recipes#search'
  post '/searchpatient' => 'patients#search'

end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
