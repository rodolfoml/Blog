# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @posts = Post.all
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_id: params[:user_id], content: params[:post][:content], title: params[:post][:title])

    if @post.save
      redirect_to @post, notice: 'The post was created!'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @post.update(content: params[:post][:content], title: params[:post][:title])
      redirect_to @post, notice: 'Update successful'
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to root_path, notice: 'Post destroyed'
  end

  private

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
