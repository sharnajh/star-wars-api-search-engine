require "sinatra"
require "swapir"

get '/' do
    erb :form
end

post '/searchapi' do
    if params[:yer] == "person"
        @id = params[:search_query].to_i
        @person_by_id = Swapir.find_person(@id)
    elsif params[:yer] == "starship"
        @id = params[:search_query].to_i
        @starship_by_id = Swapir.find_starship(@id)
    elsif params[:yer] == "all-people"
        @all_people = Swapir.get_all_people()
    elsif params[:yer] == "all-films"
        @all_films = Swapir.get_all_films()
    end
    erb :results
end