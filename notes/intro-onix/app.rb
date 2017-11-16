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

get '/onix/students/:id' do
  @student = students[params[:id].to_i]
  erb :onix_student
end

# get '/onix/students/1' do
#   @student = students[0]
#   erb :onix_student
# end

# get '/onix/students/2' do
#   @student = students[1]
#   erb :onix_student
# end



# Mostrar un formulario para datos estudiante
get '/onix/students/new' do
  erb :new_student
end

# Crear el estudiante
post '/onix/students/create' do
  nickname = params[:nickname]
  students << nickname
  @names = students
  erb :onix_v2
end














