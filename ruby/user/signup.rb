get '/user/signup' do


  erb :'/user/signup'
end

post '/creating_user' do

  User.create(username: params[:username], password: params[:password])
end