

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
get '/owners/:id/dogs/new' do
  @owner = Owner.find(params[:id])
  erb :"dogs/new"
end

# SHOW
get '/dogs/:id' do
  @dog = Dog.find(params[:id])
  erb :"dogs/show"
end

# CREATE
post '/owners/:id/dogs' do
  @owner = Owner.find(params[:id])
  @dog = @owner.dogs.new(params[:dog])
  if @dog.save
    redirect "/owners/#{@owner.id}"
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



