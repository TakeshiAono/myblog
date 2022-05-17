class BlogsController < ApplicationController
  before_action :set_blog, only: %i[ show edit update destroy ]

  # GET /blogs or /blogs.json
  def index
    @blogs = Blog.all
  end

  # GET /blogs/1 or /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    @blog = Blog.new

    

  end

  # GET /blogs/1/edit
  def edit

  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: "投稿しました"      
    else
      redirect_to blogs_path, notice: "投稿失敗しました"
    end
    
  end

  # POST /blogs or /blogs.json
  def confirm

    @blog = Blog.new(blog_params)

    # @blog = Blog.find(4)

      # if @blog.save

      # else

      # end
      # redirect_to blogs_path
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

  # DELETE /blogs/1 or /blogs/1.json
  def destroy
    @blog.destroy

    respond_to do |format|
      format.html { redirect_to blogs_url, notice: "Blog was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
end
