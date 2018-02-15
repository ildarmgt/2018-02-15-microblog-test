# show profile for specific user
# to link for user_id #4 have to use /user/4/profile
get '/user/:user_id/profile' do 
  # REMOVE REMOVE REMOVE *******************
    # session[:current_user_id] = 1
  # REMOVE REMOVE REMOVE *********************
  p session[:current_user_id]
  puts session[:current_user_id].inspect
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
    @session_user = nil;
    @session_user_ishomepage = false;
  end

  # display the profile html.erb file
  erb :'user/profile'
end