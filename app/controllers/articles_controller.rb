class ArticlesController < ApplicationController

  include ArticlesHelper

  # Display all articles
  def index
    @articles = Article.all
  end

  # Diplay one particular article
  def show
    @article = Article.find(params[:id])

    #creating blank comment object.
    @comment = Comment.new
    @comment.article_id = @article.id

  end

  # Create a form for new article
  def new
    @article = Article.new
  end

  # Create and save a new article in database
  # One way of creating articles

  # def create
  #   @article = Article.new
  #   @article.title = params[:article][:title]
  #   @article.body = params[:article][:body]
  #   @article.save

  #   redirect_to article_path(@article)
  # end

  #Another way of writing above action
  # def create
  #   @article = Article.new(
  #     title: params[:article][:title],
  #     body: params[:article][:body])
  #   @article.save
  #   redirect_to article_path(@article)
  # end

  # Third way sending the whole params hash.
  def create
    @article = Article.new(article_params)
    @article.save

    flash.notice = "Article '#{@article.title}' Created!"

    redirect_to article_path(@article)
  end

  # EDIT AN ARTICLE
  def edit
    @article = Article.find(params[:id])
  end

  # Update an article
  def update
    @article = Article.find(params[:id])
    @article.update(article_params)

    flash.notice = "Article '#{@article.title}' Updated!"

    redirect_to article_path(@article)
  end

  # to delete the article
  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Article '#{@article.title}' Deleted!"

    redirect_to articles_path
  end

end
