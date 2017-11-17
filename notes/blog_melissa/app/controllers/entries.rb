post '/entries' do
  @entry = Entry.new(title: params[:title], body: params[:body])
  arr = Tag.sanitize_tag_input(params[:entry])


  arr.each do |tag|
    tag_to_find = Tag.find_by(tag: tag)
    if tag_to_find
      @entry.tags << tag_to_find
    else
      tag = Tag.new(tag: tag)
      @entry.tags << tag
    end
  end

  if @entry.save
    redirect '/'
  end
end

get '/:id/edit' do
  @entry = Entry.find_by(id: params[:id])
  erb :edit
end

get '/:id' do
  @entry = Entry.find_by(id: params[:id])
  erb :show
end

patch '/entries/:id' do
  entry = Entry.find_by(id: params[:id])
  tags = params[:entry][:tags].split(',')
  tags = tags.map do |tag|
    Tag.new(tag)
  end
  entry.update(
    title: params[:title],
    body: params[:body],
    tags: tags
  )
  redirect '/'
end

get "/:id/delete" do
  entry = Entry.find_by(id: params[:id])
  entry.destroy
  redirect '/'
end
