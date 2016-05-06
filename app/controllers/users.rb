get '/users/login' do
  erb :'/users/login'
end

post '/users' do
  user = User.find_by( email: params[:user][:email] )
  if user
    if user.authenticate( params[:user][:password] )
      session[ :id ] = user.id
      redirect "/users/#{ user.id }"
    end
  end
  @error = "Sorry, your credentials were invalid, please try again!"
  erb :'/users/login'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users/new' do
  user = User.create( params[:user] )
  session[ :id ] = user.id
  redirect "/users/#{ user.id }"
end

get '/users/:id' do
  if current_user.id == params[ :id ].to_i
    @user = User.find_by( id: params[ :id ] )
    erb :'/users/profile'
  else
    erb :'users/unauth'
  end
end

get '/users/:id/edit' do
  erb :'/users/edit'
end

put '/users/:id/edit' do
  if current_user.update_attributes( params[ :user ] )
    redirect "/users/#{ current_user.id }"
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

delete '/delete' do
  current_user.destroy
  redirect '/'
end
