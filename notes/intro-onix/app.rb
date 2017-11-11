require 'sinatra'
require 'pry'

students = %w(angie nicolas ferney jonnatan pepito)

# Ruta
get '/' do
  "<h1>hola</h1>"
end

# ERB
# Templating
get '/onix' do
  erb :onix
end

get '/onix/v2' do
  @names = students
  erb :onix_v2
end


# Mostrar un formulario para datos estudiante
get '/onix/students/new' do
  erb :new_student
end

# Crear el estudiante
post '/onix/students/create' do
	binding.pry
  nickname = params[:nickname]
  students << nickname
  @names = students
  erb :onix_v2
end




