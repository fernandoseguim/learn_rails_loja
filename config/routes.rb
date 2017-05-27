Rails.application.routes.draw do

  resources :departamentos
  resources :produtos, only: [:new, :create, :destroy, :edit, :update]

  #custom routes
  get "produtos/busca" => "produtos#search", as: "busca_produtos"
  get "produtos" => "produtos#show_all", as: "all_produtos"
  root "produtos#index"
end
