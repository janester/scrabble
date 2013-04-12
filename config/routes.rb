Scrabble::Application.routes.draw do

  root :to => 'home#index'
  resources :channels do
    collection do
      get "refresh"
      get "correct_chat"
      post "send_chat"
      get "show_game"
    end
  end
  resources :games do
    collection do
      post "join_game"
    end
  end
  post 'login' => 'session#create'
  delete '/login' => 'session#destroy'

end
