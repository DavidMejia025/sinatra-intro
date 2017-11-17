
get '/' do
  if params[:search]
    @entries  = Entry.includes(:tags).where(tags: {tag: 'alitas'})
  else
    @entries = Entry.all
  end
  @tags = Tag.all
  erb :index
end
