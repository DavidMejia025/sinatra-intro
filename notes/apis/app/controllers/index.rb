get '/' do
  response  = HTTParty.get('https://api.github.com/emojis')
  @emojis = response.parsed_response
  erb :index
end

get '/gists/new' do
  erb :new
end

post '/gists' do
  gist = {
    description: params[:description],
    public: true,
    files: {
      "chiste.txt" => {
        content: params[:content]
      }
    }
  }

  headers = {'User-Agent' => 'pepito', 'Authorization' => "token 352e599fc240cf3e7bb089f7255210844de1fca2"}
  response = HTTParty.post('https://api.github.com/gists', {headers: headers , body: gist.to_json})

  gist = response.parsed_response
  redirect gist["html_url"]
end
