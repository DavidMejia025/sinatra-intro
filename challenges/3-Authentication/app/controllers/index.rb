get '/' do
 # Homepage
 # Por hacer : Mostrar todos los usuario si se esta logueado
 @users = User.all
 @session = session[:user_id]
 p current_user
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  # render sign-in page
  erb :sign_in
end

post '/sessions' do
  user = User.find_by email: params[:email] 
  flag = validate(user, params)
  if flag == 0
  	session[:user_id] = user.id
    redirect '/'
	elsif flag == 1
		redirect '/users/new'
	else
		redirect '/sessions/new'
  end
end

delete '/sessions/:id' do
  # sign-out
  session[:user_id] = nil
  erb :sign_in
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  # sign-up a new user
  user = User.create(params[:user])
  redirect '/sessions/new'
end

