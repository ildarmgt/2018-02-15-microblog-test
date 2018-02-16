get '/user/:page_user_id/profile' do
  @user = User.find(params[:id])
  erb :'/user/profile'
end


post '/user_logging_' do
  username = params[:username]
  password = params[:password]
  # stores the username and password from the form

  stored_user = User.where(username: username).first
  # user is now the first match in database where username matches client text box input

  if !!stored_user # checks to see if the user exists

    if stored_user.password == password
      # checks the database to see if the password entered matches the password in the database

      session[:current_user_id] = stored_user.id
      # stores the user id while logged in

      redirect '/user/' + session[:current_user_id].to_s + '/profile'
    else
      # if wrong password, redirects you to home page

      redirect '/?notice_id_wrong=' +  CGI.escape("3")
    end

  else
    # if user does not exist, redirects you to the home pages

    redirect '/?notice_id_wrong=' + CGI.escape("3")
  end
end

# Allows the user to log out and clears the session id
post '/logging_out' do
  session[:current_user_id] = nil
  redirect '/?notice_id=2'
end
