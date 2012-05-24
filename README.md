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

### Exercise Retrospective

### Reading

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