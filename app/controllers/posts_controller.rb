class PostsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update]
    def show
        @post = Post.find(params[:id])
        # binding.pry
        @comment = @post.comments
    end

    def index
        @posts = Post.order(created_at: :desc).page(params[:page]).per(1)
      end

    def new
        @post = Post.new
      end

    def create
        @post = current_user.posts.build(post_params)
        if @post.save
            redirect_to @post
        else
            render :new
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(article_params)
            redirect_to @post, notice: 'POst was successfully updated.'
        else
            render :edit
        end

    end
    
    private

    def post_params
        params.require(:post).permit(:title, :content, :user_id)
    end
end
