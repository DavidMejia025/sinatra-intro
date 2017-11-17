# Rutas de Pages
get '/' do
  erb :index
end

# Rutas de USER
get '/users/new' do
  erb :new
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    redirect '/login'
  else
    @errors = @user.errors.full_messages
    erb :new
  end
end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :show
end

# Rutas de Session
get '/login' do
  erb :login
end

delete '/session' do
  session[:user_id] = nil
  redirect '/'
end

post '/login' do
  if @user = User.find_by(email: params[:email])
    if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.id}"
    else
      @error = 'Wrong password'
      erb :login
    end
  else
    @error = 'email does not exist'
    erb :login
  end
end


