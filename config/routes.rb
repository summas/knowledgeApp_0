Rails.application.routes.draw do

  devise_for :accounts, controllers: { registrations: 'accounts/registrations'}

  root 'articles#index'

  get 'group_edits/index'
  get 'group_edits/index/:id', to: 'group_edits#index'
  get 'group_edits/add'
  post 'group_edits/add'
  get 'group_edits/edit/:id', to: 'group_edits#edit'
  
  delete 'group_edits/delete/:id', to: 'group_edits#delete'

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
  get 'articles/index/:id', to: 'articles#index'
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
  get 'categories/delete/:id', to: 'categories#delete'
  post 'categories/delete/:id', to: 'categories#delete'
  delete 'categories/delete/:id', to: 'categories#delete'

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
  delete 'groups/delete/:id', to: 'groups#delete'

  # devise_for :accounts, controllers: {
  #   sessions: 'accounts/sessions'
  # }
  # devise_for :accounts, :controllers => {
  #   :registrations => 'accounts/registrations'
  #  }

   #devise_for :accounts,controllers: { registrations: "accounts/registrations",}

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
