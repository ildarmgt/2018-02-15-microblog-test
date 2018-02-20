
get '/user/signup' do
  
  @error_msg = params[:msg].to_i == 1 ? "This user name is taken" : " "

  erb :'/user/signup'
end

post '/creating_user' do

  if (!! User.find_by(username: params[:username]))
    # need to refresh page and warn user 
    redirect '/user/signup?msg=1'
    
    
  else
    # if unique name
    User.create(username: params[:username], password: params[:pass1])

    session[:current_user_id] = User.find_by(username: params[:username]).id
    @session_user = User.find_by(username: params[:username])

    redirect '/'
  end

  
end