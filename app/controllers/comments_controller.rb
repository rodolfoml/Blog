# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :find_comment, only: %i[edit update destroy]
  before_action :find_comments_by_post_id, only: %i[show]

  def show; end

  def new
    @comment = Comment.new
    @comment.post_id = params[:post_id]
  end

  def create
    @comment = Comment.new(post_id: params[:post_id], content: params[:comment][:content])

    if @comment.save
      redirect_to root_path, notice: 'The comment was created!'
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @comment.update(content: params[:comment][:content])
      redirect_to root_path, notice: 'Update successful'
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to root_path, notice: 'Comment destroyed'
  end

  private

  def find_comment
    @comment = Comment.find(params[:id])
  end

  def find_comments_by_post_id
    @comments = Comment.where(post_id: params[:post_id])
  end
end
