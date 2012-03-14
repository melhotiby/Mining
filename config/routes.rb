Mining::Application.routes.draw do
  devise_for :users
  resources :users

  resources :leads
  match '/lead_form' => 'leads#lead_form'
  post '/lead_form_submit' => 'leads#lead_form_submit'
  root :to => 'leads#lead_form'

end
