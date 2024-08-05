class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [:edit, :update, :toggle_status]

  def index
    if params[:tab] == "draft"
      @posts = current_user.posts.where(status: "DRAFT").order(created_at: :desc)
    else
      @posts = current_user.posts.recent
    end
  end

  def show
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_index_path(tab: "published"), notice: "Post was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_index_path(tab: "published"), notice: "Post was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def toggle_status
    @post.update(status: params[:status].upcase)

    redirect_to posts_index_path(tab: "published"), notice: "Post was successfully updated."
  end

  private

    def set_post
      @post = current_user.posts.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :status, :excerpt)
    end
end
