get '/user/delete_confirm/' do
  erb :'user/delete_confirm'
end

post 'deleting_account' do
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

   
    if !! session_user_isloggedin      
      if params[:main__delete_confirm]
        # delete account if confirmed
        @session_user.destroy()

        # kill session
        session[:current_user_id] = nil
        
        # send to landing
        redirect '/'
      end      
    end

    redirect '/'

end
