Rails.application.routes.draw do
  # 주소창에 /posts/new 입력하면 posts의 new 액션으로 보내라
  get '/posts/new' => 'posts#new'
  get '/posts/create' => 'posts#create'
  
  # Read
  root 'posts#index'
  get '/posts/show/:post_id' => 'posts#show'
  
  # Update
  get '/posts/edit/:post_id' => 'posts#edit'
  get '/posts/update/:post_id' => 'posts#update'
  
  # Delete
  get '/posts/destroy/:post_id' => 'posts#destroy', as: 'post_destroy'
  
  
  get '/posts/edit/:post_id' => 'posts#edit'
  post '/posts/update/:post_id' => 'posts#update'
end
