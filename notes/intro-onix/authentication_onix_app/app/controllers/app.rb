#----------- SESSIONS -----------
get '/' do
  @users = User.all
  erb :index
end

#----------- SESSIONS -----------

get '/sign_in' do
  erb :sign_in
end

post '/sessions' do
  user = User.find_by(email: params[:email])
  if user
    if user.authenticate(params[:password])
      # session es un hash que nos da sinatra que ya esta inicializado
      session[:user_id] = user.id
      redirect "/users/#{user.id}"
    else
      @error = "Password incorrecto"
      erb :sign_in
    end
  else
    @error = "Usuario no existe"
    erb :sign_up
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
  @user = User.new(params[:user])
  if @user.save
    redirect '/sign_in'
  else
    @errors = @user.errors.full_messages
    erb :sign_up
  end
end

get '/users/:id' do
  if current_user
    erb :show
  else
    redirect '/'
  end
end










