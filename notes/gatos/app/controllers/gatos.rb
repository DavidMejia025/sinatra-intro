
# INDEX
get '/cats' do
  @cats = Cat.all
  erb :index
end

# NEW
get '/cats/new' do
  erb :new
end

# CREATE
post '/cats' do
  new_cat = Cat.new(params[:cat])
  if new_cat.save
    redirect '/cats'
  else
    @errors = new_cat.errors.full_messages
    erb :new
  end
end

# SHOW
get '/cats/:id' do
  @cat = Cat.find(params[:id])
  erb :show
end


# EDIT
get '/cats/:id/edit'  do
  @cat = Cat.find(params[:id])
  erb :edit
end

# UPDATE
patch '/cats/:id' do
  @cat = Cat.find(params[:id])
  if @cat.update(name: params[:name], age: params[:age])
    redirect "/cats/#{@cat.id}"
  else
    @errors = @cat.errors.full_messages
    erb :edit
  end
end

# DESTROY
delete '/cats/:id' do
  cat = Cat.find(params[:id])
  cat.destroy
  redirect '/cats'
end







