get '/' do
  @emojis = HTTParty.get("https://api.github.com/emojis")
  erb :index
end

# new
get '/gists/new' do
  erb :new
end

# Create gist
post '/gists' do
  gist = {
    description: params[:gist][:description],
    public: true,
    files: {
      "file1.txt" => {
        content: params[:gist][:content]
      }
    }
  }
  created_gist = HTTParty.post("https://api.github.com/gists", {
    headers: {
      'User-Agent': 'Pepito',
      "Authorization": "token 88dea235caf220bad487f8340f36c4f9a0ab50cd"
    },
    body: gist.to_json
  })
  @url = created_gist.parsed_response["html_url"]
  erb :show
end

post '/gists' do
  api = Github::Client.new
  gist = api.create_gist(params[:gist])
  @url = gist["html_url"]
  erb :show
end


















# get '/' do
#   # api = Github::Client.new
#   headers = {"User-Agent" => 'Cool as fuck'}
#   @emoji_response = HTTParty.get('https://api.github.com/emojis', headers: headers)
#   erb :index
# end
#
#
# get '/gists/new' do
#   erb :"new_gist"
# end
#
# get '/gists' do
#   @gist = JSON.parse(params[:gist])
#   p @gist
#   erb :show
# end
#
#


# parsed_response={
#   "url"=>"https://api.github.com/gists/126baa0bae80016b6eebaca7146c730d", "forks_url"=>"https://api.github.com/gists/126baa0bae80016b6eebaca7146c730d/forks", "commits_url"=>"https://api.github.com/gists/126baa0bae80016b6eebaca7146c730d/commits", "id"=>"126baa0bae80016b6eebaca7146c730d", "git_pull_url"=>"https://gist.github.com/126baa0bae80016b6eebaca7146c730d.git", "git_push_url"=>"https://gist.github.com/126baa0bae80016b6eebaca7146c730d.git", "html_url"=>"https://gist.github.com/126baa0bae80016b6eebaca7146c730d", "files"=>{"file1.txt"=>{"filename"=>"file1.txt", "type"=>"text/plain", "language"=>"Text", "raw_url"=>"https://gist.githubusercontent.com/anonymous/126baa0bae80016b6eebaca7146c730d/raw/6894f1690424db8d4f164dcd1a12dba77f897161/file1.txt", "size"=>10, "truncated"=>false, "content"=>"como estas"}}, "public"=>true, "created_at"=>"2017-04-07T19:49:08Z", "updated_at"=>"2017-04-07T19:49:08Z", "description"=>"hola", "comments"=>0, "user"=>nil, "comments_url"=>"https://api.github.com/gists/126baa0bae80016b6eebaca7146c730d/comments", "forks"=>[], "history"=>[{"user"=>{"login"=>"invalid-email-address", "id"=>148100, "avatar_url"=>"https://avatars3.githubusercontent.com/u/148100?v=3", "gravatar_id"=>"", "url"=>"https://api.github.com/users/invalid-email-address", "html_url"=>"https://github.com/invalid-email-address", "followers_url"=>"https://api.github.com/users/invalid-email-address/followers", "following_url"=>"https://api.github.com/users/invalid-email-address/following{/other_user}", "gists_url"=>"https://api.github.com/users/invalid-email-address/gists{/gist_id}", "starred_url"=>"https://api.github.com/users/invalid-email-address/starred{/owner}{/repo}", "subscriptions_url"=>"https://api.github.com/users/invalid-email-address/subscriptions", "organizations_url"=>"https://api.github.com/users/invalid-email-address/orgs", "repos_url"=>"https://api.github.com/users/invalid-email-address/repos", "events_url"=>"https://api.github.com/users/invalid-email-address/events{/privacy}", "received_events_url"=>"https://api.github.com/users/invalid-email-address/received_events", "type"=>"User", "site_admin"=>false}, "version"=>"8cc1d6f102f4761233e4c64b83edef5560a38d8a", "committed_at"=>"2017-04-07T19:49:08Z", "change_status"=>{"total"=>1, "additions"=>1, "deletions"=>0}, "url"=>"https://api.github.com/gists/126baa0bae80016b6eebaca7146c730d/8cc1d6f102f4761233e4c64b83edef5560a38d8a"}], "truncated"=>false}, @response=#<Net::HTTPCreated 201 Created readbody=true>, @headers={"server"=>["GitHub.com"], "date"=>["Fri, 07 Apr 2017 19:49:09 GMT"], "content-type"=>["application/json; charset=utf-8"], "content-length"=>["2342"], "connection"=>["close"], "status"=>["201 Created"], "x-ratelimit-limit"=>["60"], "x-ratelimit-remaining"=>["50"], "x-ratelimit-reset"=>["1491596209"], "cache-control"=>["public, max-age=60, s-maxage=60"], "vary"=>["Accept", "Accept-Encoding"], "etag"=>["\"dbf30b5eb66ea134c0161e0be2d2b79c\""], "location"=>["https://api.github.com/gists/126baa0bae80016b6eebaca7146c730d"], "x-github-media-type"=>["github.v3; format=json"], "access-control-expose-headers"=>["ETag, Link, X-GitHub-OTP, X-RateLimit-Limit, X-RateLimit-Remaining, X-RateLimit-Reset, X-OAuth-Scopes, X-Accepted-OAuth-Scopes, X-Poll-Interval"], "access-control-allow-origin"=>["*"], "content-security-policy"=>["default-src 'none'"], "strict-transport-security"=>["max-age=31536000; includeSubdomains; preload"], "x-content-type-options"=>["nosniff"], "x-frame-options"=>["deny"], "x-xss-protection"=>["1; mode=block"], "x-served-by"=>["10ea50bffaded85949561216def301f3"], "x-github-request-id"=>["C0EA:4287:177BA40:1D29634:58E7ED33"]}
