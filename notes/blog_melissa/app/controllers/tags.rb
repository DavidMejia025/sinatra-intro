get '/tags' do
  redirect '/'
end

get '/tags/?' do
  @matching_entries = []
  entries = Entry.all
  entries.each do |entry|
    entry.tags.each do |tag|
      if tag.tag == params[:search]
        @matching_entries << entry
      end
    end
  end
  erb :entries_for_tag
end

