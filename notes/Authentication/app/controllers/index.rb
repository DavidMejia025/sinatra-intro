get '/' do
 # Homeage
 # Por hacer : Mostrar todo los usuario si se esta logueado
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  user = User.find_by(email: params[:email])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    @error = 'Wrong Password'
    erb :sign_in
  end
end

delete '/sessions' do
  session[:user_id] = nil
  redirect '/'
end

#----------- USERS -----------

get '/users/new' do
  erb :sign_up
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    redirect '/'
  else
    erb :sign_in
  end
end
