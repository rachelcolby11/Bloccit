Rails.application.routes.draw do

  get 'advertisements/index'

  get 'advertisements/show'

  devise_for :users
resources :posts, :advertisements

get 'about' => 'welcome#about'

   root to: 'welcome#index'

end
