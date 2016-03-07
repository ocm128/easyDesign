Rails.application.routes.draw do

  # Al entrar a dominio/carrito redirige al controlador payments y acción carrito
  get '/carrito', to: 'payments#carrito'
  get '/compras', to: 'payments#compras'
  get 'payments/express'
  get 'transactions/checkout'
  resources :attachments
  resources :payments
  resources :posts

  # registrations es el controlador registrations_controller de Devise, omniauth_callbacks
  # es el controlador encargado de la autenticación con facebook y twitter
  devise_for :usuarios, controllers: {omniauth_callbacks: "omniauth_callbacks",
                                                          registrations: "registrations"}

  resources :usuario
  get 'welcome/index'
  post 'usuario/follow'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'


end
