# show profile for specific user
# to link for user_id #4 have to use /user/4/profile
get '/user/:page_user_id/profile' do 


  erb :'user/profile'
end