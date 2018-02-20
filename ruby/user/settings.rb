# show editing settings page for logged in user
get '/user/settings' do

  # grab id of the user signed in
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
  
  # p @session_user
  # p session_user_isloggedin
  # p this_session_id

  # show main page if logged out, show settings page if logged in
  if !! session_user_isloggedin
    erb :'user/settings'
  else    
    redirect '/'
  end
end

# apply changes to the values that changed
post '/editing_account' do

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

  # get out if not logged in
  if ! session_user_isloggedin
    redirect '/'
  end

  # grab text box values
  from_txt_change_username = params[:txt_change_username]
  from_pass_change_pass = params[:pass_change_pass]

  # if values are non-empty, write those values to the database
  if !from_txt_change_username.blank?
    @session_user.update_attribute(:username, from_txt_change_username)
  end
  if !from_pass_change_pass.blank?
    @session_user.update_attribute(:password, from_pass_change_pass)
  end

  # send back to landing
  redirect '/editing_account'

end
