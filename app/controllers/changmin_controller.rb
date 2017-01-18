class ChangminController < ApplicationController
  def board
    @everypost = Post.all
  end
  
  def assignment
    @num = params[:num]
    @aa = Assignment.where(assignment_num: @num.to_i,
                           as_type: "homework").first #n차숙제
    @submission = Assignment.where(assignment_num: @num,
                                   user_id: current_user.id).length
    @assignments = Assignment.where(assignment_num: @num, as_type: "submission")
  end
  
  def detail
    @a = Assignment.find(params[:post_num])
  end
  
  
  def upload_assign
    img_post = Assignment.create(title: params[:title], 
                          content: params[:content],
                          as_type: params[:as_type],
                          assignment_num: params[:as_num].to_i+1,
                          user_id: current_user.id)
    my_file = params[:pic]
    uploader = YonseiUploader.new
    uploader.store!(my_file)
    img_post.img_url = uploader.url
    img_post.save
    
    redirect_to "/changmin/assignments"
  end
  #숙제 올리기
  
  def assignments
    @assignments = Assignment.where(as_type: "homework").reverse
  end
  
  
  
  
  def upload_post
    Post.create(title: params[:title],
                content: params[:content],
                user_id: current_user.id)
    redirect_to '/changmin/board'
  end
  
  def posts
    @the_post = Post.find(params[:num])
  end
  
  def upload_assignment
     img_post = Assignment.create(title: params[:title], 
                          content: params[:content],
                          assignment_num: params[:an],
                          as_type: "submission",
                          user_id: current_user.id)
    my_file = params[:pic]
    uploader = YonseiUploader.new
    uploader.store!(my_file)
    img_post.img_url = uploader.url
    img_post.save

    redirect_to '/changmin/assignment/' + params[:an]
  end
end
