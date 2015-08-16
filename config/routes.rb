Rails.application.routes.draw do
  get '/our_practice', to: 'our_practice#index'
  get '/about_us', to: 'about_us#index'
  get '/patient_resources', to: 'patient_resources#index'
  get '/contact_us', to: 'contact_us#index'
  get '/services', to: 'services#index'
  get '/our_technology', to: 'our_technology#index'

  root 'home#index'
end
