Rails.application.routes.draw do

  devise_for :accounts, controllers: {
    sessions: 'accounts/sessions',
    passwords: 'accounts/passwords',
    registrations: 'accounts/registrations',
    confirmations: 'accounts/confirmations'
  }

  root 'reacts#index'

  get 'reacts/group'
  get 'reacts/group/:id', to: 'reacts#group'

  get 'reacts/article/:id', to: 'reacts#index'
  get 'reacts/index'
  get 'reacts/ajax'
  get 'reacts/ajax/:id', to: 'reacts#ajax'
  get 'reacts/ajax/:id/:group_id', to: 'reacts#ajax'
  get 'reacts/category'

  get 'group_edits/index'
  get 'group_edits/index/:id', to: 'group_edits#index'
  get 'group_edits/add'
  post 'group_edits/add'
  delete 'group_edits/delete/:g_reration_id/:account_id', to: 'group_edits#delete'

  get 'admins/menu'
  get 'admins/index'
  get 'admins/add'
  post 'admins/add'
  get 'admins/edit'
  get 'admins/group_add'
  post 'admins/group_add'
  get 'admins/groupEdit/:id', to: 'admins#group_edit'
  get 'admins/edit/:id', to: 'admins#edit'
  patch 'admins/edit/:id', to: 'admins#edit'
  get 'admins/delete'
  delete 'admins/delete/:id', to: 'admins#delete'

  get 'articles', to: 'articles#index'
  get 'articles/index'
  get 'articles/index/:id/:name', to: 'articles#index'
  get 'articles/category'
  get 'articles/category/:id', to: 'articles#category'
  get 'articles/show'
  get 'articles/show/:id', to: 'articles#show'
  get 'articles/group'
  get 'articles/react'
  get 'articles/ajax'

  get 'article_edits/index'
  get 'article_edits/add'
  post 'article_edits/add'
  get 'article_edits/edit'
  get 'article_edits/:id', to: 'article_edits#edit'
  patch 'article_edits/:id', to: 'article_edits#edit'
  get 'article_edits/delete'
  get 'article_edits/delete/:id', to: 'article_edits#delete'
  post 'article_edits/delete/:id', to: 'article_edits#delete'
  get 'article_edits/category/:id', to: 'article_edits#category'

  get 'categories/index'
  get 'categories', to: 'categories#index'
  get 'categories/add'
  post 'categories/add'
  get 'categories/edit'
  get 'categories/edit/:id', to: 'categories#edit'
  patch 'categories/edit/:id', to: 'categories#edit'
  patch 'categories/stop/:id', to: 'categories#stop'
  patch 'categories/restart/:id', to: 'categories#restart'

  get 'site_configs/index'
  get 'site_configs' , to: 'site_configs#index'
  get 'site_configs/edit'
  patch 'site_configs/edit'

  get 'groups/index'
  get 'groups', to: 'groups#index'
  get 'groups/add'
  post 'groups/add'
  get 'groups/edit/:id', to: 'groups#edit'
  patch 'groups/edit/:id', to: 'groups#edit'
  patch 'groups/stop/:id', to: 'groups#stop'
  patch 'groups/restart/:id', to: 'groups#restart'

  resources :testsessions, only: :create

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
