class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]

  def index
    @posts = Post.all
  end

  def show
    @favorite = current_user.favorites.find_by(post_id: @post.id)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = current_user.posts.build(permitted_parameters)
    # respond_to do |format|
      if @post.save
        redirect_to @post, notice: "Post has been successfully created." 
      else
        render :new
      end
    end

  def update
    respond_to do |format|
      if @post.update(permitted_parameters)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
    end
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def permitted_parameters
      params.require(:post).permit(:title, :content, :image)
    end
  end
