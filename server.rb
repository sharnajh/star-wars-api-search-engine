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
        @starship_name = "Name: " + @starship_by_id["name"]
        @starship_model = "ID: " + @starship_by_id["model"]
        @starship_manufacturer = "Manufacturer: " + @starship_by_id["manufacturer"]
        @starship_cost_in_credits = "Cost in credits: " + @starship_by_id["cost_in_credits"]
        @starship_length = "Length: " + @starship_by_id["length"]
        @starship_max_atmosphering_speed = "Max atmosphering speed: " + @starship_by_id["max_atmosphering_speed"]
        @starship_crew = "Crew: " + @starship_by_id["crew"]
        @starship_cargo_capacity = "Cargo capacity: " + @starship_by_id["cargo_capacity"]
        @starship_consumables ="Consumables: " + @starship_by_id["consumables"]
        @starship_hyperdrive_rating = "Hyperdrive rating: " + @starship_by_id["hyperdrive_rating"]
        @starship_MGLT = "MGLT: " + @starship_by_id["MGLT"]
        @starship_starship_class = "Starship class: " + @starship_by_id["starship_class"]
    elsif params[:yer] == "all-people"
        @all_people = Swapir.get_all_people()
    elsif params[:yer] == "all-films"
        @all_films = Swapir.get_all_films()
    end
    erb :results
end