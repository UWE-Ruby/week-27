## Offline Jobs

Last exercise we focused on removing code from the controller and moved it out
into callbacks and/or observers. This helped with the manageability of the code
but it failed to alleviate the problem of forcing the user to wait until the
request was done sending out posts to all their services that they selected.

Imagine what the experience would be like if one of the services went offline or
became delayed. The user would wait endlessly for the page to finish loading
even though their work was done.

Imagine that the site became popular and all of sudden you had a large number
of users wanting to post to all their services. Your servers would soon be
crippled by your own success.

### Exercise

This week we are going to look at a simple Rails application that allows a user
to create an account and then tie different social network accounts to their
account. Users are able to create posts and have them echo'd to all the services
that they have set up.

The goal of this week's exercise is to move the code that echoes their post
to their specified services into an offline job.

#### Goal

Understand the code.

Move the code that publishes content to __Twitter__ and __Facebook__ out of
controller and move it into it's own job.

### Reading

> Ruby Meta-programming - Friday
>
> Ryan Bates - [Setting up Resque](http://asciicasts.com/episodes/271-resque)
>
> [The Little Redis Book](http://openmymind.net/redis.pdf)
>
> Read about another alternative to Resque called Delayed Job and how it is
> implemented. Ryan Bates - [Delayed Job](http://asciicasts.com/episodes/171-delayed-job)
>
> Peep Code - [Aaron Patterson - Play by Play](https://peepcode.com/products/play-by-play-tenderlove-ruby-on-rails)
>

### Further Exercise

* After a user authorizes a service, enqueue a job that will retrieve content
  from that service.

    > From Twitter or Facebook you may retrieve their timeline, friends, likes,
    or hobbies.

* Store that content within the database

    > Modeling the content here, you may want to extract only certain pieces of
    data or you may want to store all the data. Ensure that you do not store
    duplicate data for the user.

* Use that content to personalize a service

    > From their list of hobbies or likes, randomly provide them a suggestion
    for the post.

* Visualize how you might continually import data on a schedule

    > How could you continually enqueue a job to import data at a specified
    interval?

### Exploration

Resque is a wrapper for Redis. It offers a layer on top of a Redis client to
perform tasks of enqueuing and dequeuing tasks.

* Launch IRB and connect to your Redis Server

```ruby
require "redis"

redis = Redis.new

redis.set "foo", "bar" # => "OK"

redis.get "foo" # => "bar"

redis.sadd "users", "albert" # => true

redis.sadd "users", "bernard" # => true

redis.sadd "users", "charles" # => true
```

* Refer to the documentation and learn about the various different data types
  and commands.

    > http://redis.io/commands
