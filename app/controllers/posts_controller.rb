class PostsController < ApplicationController
  def index
    # @posts = fetch_from_redis
    @posts = Post.all
  end

  private
    def fetch_from_redis
      posts = $redis.get "posts"

      if posts.nil?
        posts = Post.includes(:user).all.to_json
        $redis.set "posts", posts
        $redis.expire("posts",3.hour.to_i)
      end
      JSON.load posts
    end
end
