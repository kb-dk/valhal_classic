# -*- encoding : utf-8 -*-
Valhal::Application.routes.draw do
  get "view_file/show"
  get "view_file/show_structmap"

  root :to => "catalog#index"

  Blacklight.add_routes(self)
  HydraHead.add_routes(self)

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  # The priority is based upon order of creation:
  # first created -> highest priority.

  #Standard resource mapping
  resources :single_file_representations
  resources :ordered_representations do
    member do
      get 'thumbnail_url'
    end
  end

  resources :works  do
      put 'new'
      get 'w_person'
      get 'metadata'
      put 'metadata'
      get 'file'
      put 'file'
      get 'finish'
      put 'finish'
      get 'part_edit'
      put 'part_edit'
      get 'file_edit'
      put 'file_edit'
  end

  resources :people do
    member do
      get 'show_image'
      get 'image_url'
      put 'add_manifest'
    end
  end

  resources :books do
    member do
      put 'create_structmap'
      put 'new'
      get 'w_person'
      get 'metadata'
      put 'metadata'
      get 'file'
      put 'file'
      get 'finish'
      put 'finish'
      get 'part_edit'
      put 'part_edit'
      get 'file_edit'
      put 'file_edit'
    end
  end
end
