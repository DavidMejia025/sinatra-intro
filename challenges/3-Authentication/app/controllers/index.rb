get '/' do
 # Homepage
 # Por hacer : Mostrar todos los usuario si se esta logueado
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
end

post '/sessions' do
  session[:user_id] = user.id
  redirect '/'
end

delete '/sessions/:id' do
  # sign-out
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
end

post '/users' do
  # sign-up a new user
end
