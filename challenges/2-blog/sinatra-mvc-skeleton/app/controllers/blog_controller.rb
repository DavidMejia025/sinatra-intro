#Entries landing page
get '/entries' do
  @entries = Entry.all
  erb :"entries/index"
end

#Create new entry
get '/entries/new' do
	erb :"entries/new"
end
post '/entries' do
	p params
	@entry = Entry.new(params[:entry])
	if @entry.save
		redirect "/entries/#{@entry.id}"
	else
		redirect '/entries/new'
	end
end

#Entry page by id
get '/entries/:id' do
	@entry = Entry.find(params[:id])
	@tags = @entry.tags.all
	erb :"entries/show"
end

#Tag page by id
get '/entries/tags/:id' do
  @tag = Tag.find(params[:id])
  @entries = @tag.entries.all
  @entries
  erb :"tags/show"
end

#Edit one entry
get '/entries/:id/edit' do
	@entry = Entry.find(params[:id])
	erb :"entries/edit"
end
patch '/entries/:id' do
	@entry = Entry.find(params[:id])
	if @entry.update(params[:entry])
		redirect "/entries/#{@entry.id}"
	else
		redirect "/entries/#{@entry.id}/edit"
	end
end

get '/entries/:id/delete' do
	@entry = Entry.find(params[:id])
	@entry.destroy
	redirect "/entries"
end