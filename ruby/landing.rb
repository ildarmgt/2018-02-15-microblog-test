get '/' do
  @notice = params[:notice_id].to_i == 2 ? 'Logged out succesfully' : ''
  @notice_wrong = params[:notice_id_wrong].to_i == 3 ? 'Wrong Username or Password' : ''
  if session[:current_user_id]
    redirect '/user/' + session[:current_user_id].to_s + '/profile'
  end

  erb :landing
end
