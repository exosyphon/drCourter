Rails.application.routes.draw do
  devise_for :users, path_names: {sign_up: ''}
  resources :text_logs do
    post '/send_text', to: 'text_logs#send_text'
    get '/view_audits', to: 'text_logs#view_audits', on: :collection
  end

  get '/our_practice', to: 'our_practice#index'
  get '/about_us', to: 'about_us#index'
  get '/patient_resources', to: 'patient_resources#index'
  get '/patient_resources/new_patient_forms', to: 'patient_resources#new_patient_forms'
  get '/patient_resources/q_a', to: 'patient_resources#q_a'
  get '/patient_resources/post_op_instructions', to: 'patient_resources#post_op_instructions'
  get '/patient_resources/surgical_instructions', to: 'patient_resources#surgical_instructions'
  get '/contact_us', to: 'contact_us#index'
  get '/services', to: 'services#index'

  get '/patient_resources/new_patient_forms/download_patient_information', to: 'patient_resources#download_patient_information'
  get '/patient_resources/new_patient_forms/download_patient_medical_history', to: 'patient_resources#download_patient_medical_history'

  root 'home#index'
end
