class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]


  def index
    @blogs = Blog.all
  end

  def show
  end

  def new
    @blog = Blog.new
  end

  def edit
  end

  def create
    @blog = Blog.new(blog_params)
    
    if params[:back]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "投稿しました"      
      else
        @error = "投稿失敗しました"
        render "confirm"
      end      
    end    
  end

  def confirm
    @blog = Blog.new(blog_params)
  end

  # PATCH/PUT /blogs/1 or /blogs/1.json
  def update
    @blog = Blog.find(params[:id])

    acheive = @blog.update(blog_params)
    if acheive === true 
      redirect_to blogs_path, notice: "更新成功"
    else
      redirect_to blogs_path, notice: "更新失敗"
    end
  end

  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_blog
      @blog = Blog.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
