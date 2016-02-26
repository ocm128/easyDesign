Rails.application.routes.draw do

  # registrations es el controlador registrations_controller de Devise, omniauth_callbacks
  # es el controlador encargado de la autenticación con facebook y twitter
  devise_for :usuarios, controllers: {omniauth_callbacks: "omniauth_callbacks",
                                                          registrations: "registrations"}
  get 'welcome/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'


end
