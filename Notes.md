# app/views/posts/index

<% if !params[:author].blank? %>
  <% @posts = Post.where(author: params[:author]) %>
<% elsif !params[:date].blank? %>
  <% if params[:date] == "Today" %>
    <% @posts = Post.where("created_at >=?", Time.zone.today.beginning_of_day) %>
  <% else %>
    <% @posts = Post.where("created_at <?", Time.zone.today.beginning_of_day) %>
  <% end %>
<% end %>

# def posts_controller#index
  # provide a list of authors to the view for the filter control
    @authors = Author.all
  # filter the @posts list based on user input
    if !params[:author].blank?
      @posts = Post.where(author: params[:author])
    elsif !params[:date].blank?
      if params[:date] == "Today"
        @posts = Post.where("created_at >=?", Time.zone.today.beginning_of_day)
      else
        @posts = Post.where("created_at <?", Time.zone.today.beginning_of_day)
      end
    else
      # if no filters are applied, show all posts
      @posts = Post.all
    end

