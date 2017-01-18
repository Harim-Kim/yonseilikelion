Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root 'home#index'
  get "home/excel"
  
  
  post 'changmin/upload_assign'
  get 'changmin/assign'  #숙제 내는 페이지
  get 'changmin/assignments' #숙제 목록
  get 'changmin/board' #게시판
  get 'changmin/write' #글쓰기
  get 'changmin/assignment/:num' => 'changmin#assignment' #n번째 숙제 페이지
  get 'changmin/assignment/:assignment_num/:post_num' => 'changmin#detail'
  get 'changmin/posts/:num' => 'changmin#posts' #글 목록
  post 'changmin/upload_post' #글 등록
  post 'changmin/upload_assignment' #숙제 등록


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
