get '/blogs' do
  if !! session[:current_user_id]

    this_session_id = (session[:current_user_id]).to_i

    # put signed in user ref into a @session_user variable
    @session_user = User.find_by(id: this_session_id)

    # true/false instance var for erb file to see if there is someone is logged in
    session_user_isloggedin = !! @session_user
  else
    # no session user
    @session_user = nil
    session_user_isloggedin = false
  end

  # page logic goes here
  

  erb :recent_blogs
end