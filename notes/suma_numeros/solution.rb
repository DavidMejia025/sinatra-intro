require 'sinatra'

get '/' do
  if params[:sum]
    @sum = params[:sum].to_i + 1
  else
    @sum = 0
  end
  erb :suma
end
