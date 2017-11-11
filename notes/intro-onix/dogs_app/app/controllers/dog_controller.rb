# CRUD

get '/' do
  erb :home
end
# CRUD de dogs

# INDEX
get '/dogs' do
  @dogs = Dog.all
  erb :"dogs/index"
end

# NEW
get '/dogs/new' do
  erb :"dogs/new"
end

# SHOW
get '/dogs/:id' do
  @dog = Dog.find(params[:id])
  erb :"dogs/show"
end

# CREATE
post '/dogs' do

  @dog = Dog.new(name: params[:name], age: params[:age])
  if @dog.save
    redirect "/dogs/#{dog.id}"
  else
    @errors = @dog.errors.full_messages
    erb :"dogs/new"
  end

end

# EDIT
get '/dogs/:id/edit' do
  @dog = Dog.find(params[:id])
  erb :"dogs/edit"
end

# UPDATE
patch '/dogs/:id' do
  # puts "*" * 50
  # puts "Holaaa llegue aca"
  # p params
  @dog = Dog.find(params[:id])
  if @dog.update(name: params[:name], age: params[:age])
    redirect "/dogs/#{dog.id}"
  else
    @errors = @dog.errors.full_messages
    erb :"dogs/edit"
  end
end

# DELETE
delete "/dogs/:id" do
  dog = Dog.find(params[:id])
  dog.destroy
  redirect '/dogs'
end

# Verbos HTTP

# - GET
#   - anchors
#   - links
#   - script
#   - form

# - POST
#   - form

# - DELETE
#   - NO esta soportado

# - PATCH/PUT
#   - No esta soportado



