# Index
get '/' do
  @dogs = Dog.all
  erb :index
end

# New
get '/dogs/new' do
  erb :new
end

# Show
get '/dogs/:id' do
  @dog = Dog.find_by(id: params[:id])
  erb :show
end

# create
post '/dogs' do
  @dog = Dog.new(params[:dog])
  if @dog.save
    status 302
    redirect "/dogs/#{@dog.id}"
  else
    @errors = @dog.errors.full_messages
    erb :new
  end
end

#edit
get '/dogs/:id/edit' do
  @dog = Dog.find_by(id: params[:id])
  erb :edit
end

#update
put '/dogs/:id' do
  dog = Dog.find_by(id: params[:id])
  dog.update(name: params[:name], age: params[:age])
  redirect "/dogs/#{dog.id}"
end

#destroy
get '/dogs/:id/delete' do
  dog = Dog.find_by(id: params[:id])
  dog.destroy
  redirect '/'
end
