# show profile for specific user
# to link for user_id #4 have to use /user/4/profile
get '/user/:user_id/profile' do
  # REMOVE REMOVE REMOVE *******************
    # session[:current_user_id] = 1
  # REMOVE REMOVE REMOVE *******************

  ###  page data

  # grab page's user's id from url
  this_page_id = params[:user_id].to_i

  # put this page user ref into instance variable for .erb access
  @this_page_user = User.find_by(id: this_page_id)

  # true/false if the url path is for an existing user
  # false would mean this user doesn't exist
  @this_page_user_isreal = !! @this_page_user

  ### session data

  # grab id of the user signed in
  if !! session[:current_user_id]

    this_session_id = (session[:current_user_id]).to_i

    # put signed in user ref into a @session_user variable
    @session_user = User.find_by(id: this_session_id)

    # true/false instance var for erb file to see if there is someone is logged in
    session_user_isloggedin = !! @session_user
    # home page if (user is logged in AND logged in user ID matches the ID of the URL
    @session_user_ishomepage = (this_page_id == this_session_id && session_user_isloggedin == true)

  else
    # no session user
    @session_user = nil;

    # most definitely not home page bc not even logged in
    @session_user_ishomepage = false;
  end

  # display the profile html.erb file
  erb :'user/profile'
end

# erase or edit a post
post '/user/post/action/:url_post_id/' do
  # grab the url parameter for id of post in question
  this_url_post_id = params[:url_post_id].to_i
  # grab the actual post if possible
  this_post_from_url = Blog.find_by(id: this_url_post_id)

  # get user who's logged in if possible
  this_session_id = (session[:current_user_id]).to_i
  @session_user = User.find_by(id: this_session_id)

  # now that we have logged in user's id and post id
  # we have to make sure this user can modify this post
  if !!this_post_from_url 
    # this is an existing post

    # if session user matches blog's owner, say canModify, else can't.
    canModify = (this_session_id == this_post_from_url.user_id && !!this_session_id)? true : false
  else
    # if not existing post, definitely can't modify
    canModify = false
    puts "post doesn't exist"
  end

  if canModify
    # if access ok, check if edit or delete action fired and execute

    # if edit submit button was hit
    if !!params[:btn_edit]
      puts "editing post"
      this_post_from_url.update_attribute(:content, params[:main__profile__history__content])
    end

    # if delete submit button was hit
    if !!params[:btn_delete]
      puts "would be deleting this post"
      this_post_from_url.destroy()
    end

    redirect '/'

  else
    # no permission to modify this post
    # redirect back to profile
    puts "permission to modify/delete post denied"
    redirect '/'
  end

end

# post new blog
post '/posting_blog' do
  
  # get user who's logged in if possible
  this_session_id = (session[:current_user_id]).to_i
  @session_user = User.find_by(id: this_session_id)
  isLoggedIn = !! @session_user

  # can only post if you are logged in
  if isLoggedIn
    # if logged in, create blog

    Blog.create(
      date: Time.new.strftime("%Y %b %d, %H:%M"),
      content: params[:main__profile__new__content],
      user_id: this_session_id
    )
    puts "post created"
    redirect '/'
  else
    # if not logged in, send to landing
    puts "post denied, not logged in"
    redirect '/'
  end

end