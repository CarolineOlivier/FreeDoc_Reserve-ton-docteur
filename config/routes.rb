Rails.application.routes.draw do
  get "appointments/new"
  get "appointments/create"
  # Route d'accueil, redirige vers l'index des docteurs
  root 'doctors#index'

  resources :doctors, only: [:index, :show]
  # La ligne resources :doctors génère automatiquement toutes les routes RESTful nécessaires pour les docteurs, 
  # y compris l'action index et pour l'action show.

  # La ligne get 'doctors', to: 'doctors#index' était redondante par rapport à resources :doctors et a donc été supprimée.

  # Vérification de l'état de santé de l'application
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Routes pour les fichiers PWA
  get 'service-worker' => 'rails/pwa#service_worker', as: :pwa_service_worker
  get 'manifest' => 'rails/pwa#manifest', as: :pwa_manifest

  # Routes pour les rendez-vous
  resources :appointments, only: [:new, :create]
end
