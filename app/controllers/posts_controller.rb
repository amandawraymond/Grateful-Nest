class PostsController < ApplicationController
  respond_to :json

  def index
    @posts = Post.all

    respond_with @posts
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end