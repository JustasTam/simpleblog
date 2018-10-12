class PostsController < ApplicationController
  http_basic_authenticate_with name: 'Justas', password: '12345', except: [:index, :show]

  def index
    @posts = Post.all
  end

  def show
    @post = get_post
  end

  def new
    @post = Post.new
  end

  def create
    # render plain: params[:post].inspect
    @post = Post.new(post_params)
    
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = get_post
  end

  def update
    @post = get_post

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = get_post
    @post.destroy
    redirect_to posts_path
  end

  def get_post
    Post.find(params[:id])
  end

  private 

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
