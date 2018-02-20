
get '/user/signup' do
  erb :'/user/signup'
end

post '/creating_user' do

  User.create(username: params[:username], password: params[:pass1])

  session[:current_user_id] = User.find_by(username: params[:username]).id
  @session_user = User.find_by(username: params[:username])
  
  redirect '/'
end