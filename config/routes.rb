Rails.application.routes.draw do

    resources :projects
    resources "contacts", only: [:new, :create]
    get 'welcome/index'
    root 'welcome#index'

    # get '*path' => redirect('/')
end
