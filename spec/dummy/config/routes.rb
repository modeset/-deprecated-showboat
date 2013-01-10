Rails.application.routes.draw do
  mount Showboat::Engine => "/showboat"
  root :to => 'pages#index'
end

