Rails.application.routes.draw do
  get "produtos" => "produtos#index"
  get "todos" => "produtos#show_all", as: "todos_os_produtos"
  root "produtos#index"
end
