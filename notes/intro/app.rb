require 'sinatra'

dogs = []

get '/' do
  @students = %w(mauricio, javier, felipe, santiago, oscar, jose)
  erb :index
end

get '/dog_form' do
  erb :dog_form
end

get '/dogs' do
  @dogs = dogs
  erb :dogs
end

get '/create/dog' do
  dogs << params
  redirect '/dogs'
end
