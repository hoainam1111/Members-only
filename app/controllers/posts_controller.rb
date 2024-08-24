class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def new
    @post = Post.new
  end

  def create
    # phương thức current_user trả về đói tượng người dùng đang đăng nhập
    # phương thức build tự động gán user_id bằng id của người dùng hiện tại
    @post = current_user.posts.build(post_params)
    
    if @post.save
      redirect_to posts_path, notice: "Post was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @posts = Post.all
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
