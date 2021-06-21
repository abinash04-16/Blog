Rails.application.routes.draw do
  get 'blog/show'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html



  post 'register', controller: :auth, action: :register
  post 'login', controller: :auth, action: :login
  get 'isAuth', controller: :auth, action: :isAuth
  get 'logout', controller: :auth, action: :logout
  post 'editUser', controller: :auth, action: :editUser

  get 'auth/getUser/:id', controller: :auth, action: :getUser
  get 'auth/getCurrentUser', controller: :auth, action: :getCurrentUser
  post 'auth/updateUser', controller: :auth, action: :updateUser
  get 'auth/getAll', controller: :auth, action: :getAllUser


  post 'blog/add', controller: :blog, action: :add
  get 'blog/show', controller: :blog, action: :show
  get 'blog/myBlogs/:user_id', controller: :blog, action: :myBlogs
  get 'blog/:blog_id', controller: :blog, action: :singleBlog
  post 'blog/update/:blog_id', controller: :blog, action: :updateBlog

  delete 'delete/:blog_id', controller: :blog, action: :delBlog

  post 'comment/add', controller: :comment, action: :add
  get 'comment/show/:blog_id', controller: :comment, action: :getAll
end
