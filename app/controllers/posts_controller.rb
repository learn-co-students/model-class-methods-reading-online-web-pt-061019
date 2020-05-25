class PostsController < ApplicationController
  # Ensure that our view has access to the controller's params hash
  helper_method :params
  # You can use helper_method in a controller to expose, or make available, a controller method in your view, but this isn't always a great idea.

  def index
    # Provide a list of authors to the view for the filter control
    @authors = Author.all
    # Write the code to do the filtering
    # Filter the @posts list based on user input
      if !params[:author].blank?
        # Ask for posts by author
        @posts = Post.by_author(params[:author])
        # Activate the date filter
        elsif !params[:date].blank?
          if params[:date] == "Today"
            @posts = Post.from_today
          else
            @posts = Post.old_news
          end
        else
        # If no filters are applied, show all posts
        @posts = Post.all
        end
      end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params)
    @post.save
    redirect_to post_path(@post)
  end

  def update
    @post = Post.find(params[:id])
    @post.update(params.require(:post))
    redirect_to post_path(@post)
  end

  def edit
    @post = Post.find(params[:id])
  end
end
