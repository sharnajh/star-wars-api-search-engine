require "sinatra"
require "swapir"

get '/' do
    erb :form
end

post '/searchapi' do
    if params[:yer] == "person"
        @id = params[:search_query].to_i
        @person_by_id = Swapir.find_person(@id)
        @person_name = "Name: " + @person_by_id["name"]
        @person_height = "Height: " + @person_by_id["height"]
        @person_mass = "Mass: " + @person_by_id["mass"]
        @person_hair = "Hair Color: " + @person_by_id["hair_color"]
        @person_birthday = "Birth Year: " + @person_by_id["birth_year"]
        @person_gender = "Gender: " + @person_by_id["gender"]
        @person_eye = "Eye Color: " + @person_by_id["eye_color"]
        @person_skin = "Skin Color: " + @person_by_id["skin_color"]
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