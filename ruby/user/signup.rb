
get '/user/signup' do
  erb :'/user/signup'
end

post '/creating_user' do

  User.create( #{username: params[:username]}, #{password: params[:pass1]} #{password: params[:pass2]} )
  redirect '/profile'
end