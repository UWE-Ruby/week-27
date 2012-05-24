!SLIDE

# Goals

!SLIDE

## Turn this ...

```ruby
def create
  post = Post.create(params[:post],:user => current_user)

  if post.twitter
    current_user.twitter.update post.message
  end

  if post.facebook
    current_user.facebook.put_wall_post post.message
  end

  redirect_to user_posts_path(current_user)
end
```

!SLIDE

## ... into this

```ruby
def create
  post = Post.create(params[:post],:user => current_user)

  Resque.enqueue(Poster,{ :user_id => current_user.id, :post_id => post.id })

  redirect_to user_posts_path(current_user)
end
```

!SLIDE

## or even better ... this

```ruby
def create
  post = Post.create(params[:post],:user => current_user)
  redirect_to user_posts_path(current_user)
end
```