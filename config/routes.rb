Rails.application.routes.draw do
  devise_for :users
  
  devise_scope :user do 
    root to: "devise/sessions#new"
    get  'users/employee_new' => 'users#employee_new'
    post 'users/employee_create' => 'users#employee_create'
    patch 'users/employee_update' => 'users#employee_update'
    put 'users/employee_update' => 'users#employee_update'
    get 'users/employees' => 'users#employee_index'
    delete 'users/employee' => 'users#employee_delete'
    get 'users/employee_edit' => 'users#employee_edit'
    get '/home' => 'users#home'
    post 'users/create' => 'users#create'
    patch '/users/update' => 'users#update'
    put 'users/update' => 'users#update'
  end 

  resources :divisions
  resources :projects 
  resources :users
end
