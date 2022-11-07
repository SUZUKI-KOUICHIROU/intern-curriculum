class Users::ArticlesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article, only: %i[ show edit update destroy ]
  
  def index
    @articles = current_user.articles.all
  end

  def show
  end

  def new
    @article = current_user.articles.new
  end

  def create
    @article = current_user.articles.new(article_params)
  if @article.save
    redirect_to user_article_path(@article), notice: "記事を作成しました。"
  else
    flash[:alert] = '失敗しました。'
    render :new
  end
  end

  def edit
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "記事を更新しました。"
      redirect_to user_article_path(@article), notice: "記事を更新しました。"
    else
      flash[:alert] = '失敗しました。'
      render :edit   
    end 
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to user_articles_url(current_user), notice: "#{@article.title}を削除しました。"
  end

    private
      def article_params
        params.require(:article).permit(:title, :content, :image)
      end
end

