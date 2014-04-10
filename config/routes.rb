# -*- encoding : utf-8 -*-
Valhal::Application.routes.draw do
  root :to => "catalog#index"

  Blacklight.add_routes(self)
  HydraHead.add_routes(self)

  devise_for :users, controllers: {omniauth_callbacks: "omniauth_callbacks"}

  # The priority is based upon order of creation:
  # first created -> highest priority.
  get "view_file/show"

  resources :basic_files do
    member do
      get 'show'
      get 'download'
      get 'preservation'
      patch 'characterize_file'
      patch 'update_preservation_profile'
    end
  end

  #Standard resource mapping
  resources :single_file_representations do
    member do
      get 'preservation'
      patch 'update_preservation_profile'
    end
  end

  resources :ordered_representations do
    member do
      get 'thumbnail_url'
      get 'download_all'
      get 'preservation'
      patch 'update_preservation_profile'
    end
  end

  resources :works  do
    member do
      get 'show'
      put 'new'
      patch 'update_person'
      get 'show_person'
      patch 'update_metadata'
      get 'show_metadata'
      patch 'update_file'
      get 'show_file'
      patch 'save_edit'
      get 'preservation'
      patch 'update_preservation_profile'
      get 'dissemination'
      patch 'send_to_dissemination'
    end
  end

  resources :people do
    member do
      get 'show_image'
      get 'image_url'
      put 'add_manifest'
      get 'preservation'
      patch 'update_preservation_profile'
    end
  end

  resources :books do
    member do
      get 'show'
      put 'create_structmap'
      put 'new'
      patch 'update_person'
      get 'show_person'
      patch 'update_metadata'
      get 'show_metadata'
      patch 'update_file'
      get 'show_file'
      patch 'save_edit'
      put 'finish_book_with_structmap'
      get 'preservation'
      patch 'update_preservation_profile'
    end
  end
end
