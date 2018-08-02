require "sinatra"
require "swapir"

get '/' do
    erb :form
end

post '/searchapi' do
    if params[:yer] == "person"
        @id = params[:search_query].to_i
        @person_by_id = Swapir.find_person(@id)
        @person_name = "Name: " + @person_by_id["name"].to_s
        @person_height = "Height: " + @person_by_id["height"].to_s
        @person_mass = "Mass: " + @person_by_id["mass"].to_s
        @person_hair = "Hair Color: " + @person_by_id["hair_color"].to_s
        @person_birthday = "Birth Year: " + @person_by_id["birth_year"].to_s
        @person_gender = "Gender: " + @person_by_id["gender"].to_s
        @person_eye = "Eye Color: " + @person_by_id["eye_color"].to_s
        @person_skin = "Skin Color: " + @person_by_id["skin_color"].to_s
    elsif params[:yer] == "starship"
        @id = params[:search_query].to_i
        @starship_by_id = Swapir.find_starship(@id)
        @starship_name = "Name: " + @starship_by_id["name"].to_s
        @starship_model = "ID: " + @starship_by_id["model"].to_s
        @starship_manufacturer = "Manufacturer: " + @starship_by_id["manufacturer"].to_s
        @starship_cost_in_credits = "Cost in credits: " + @starship_by_id["cost_in_credits"].to_s
        @starship_length = "Length: " + @starship_by_id["length"].to_s
        @starship_max_atmosphering_speed = "Max atmosphering speed: " + @starship_by_id["max_atmosphering_speed"].to_s
        @starship_crew = "Crew: " + @starship_by_id["crew"].to_s
        @starship_cargo_capacity = "Cargo capacity: " + @starship_by_id["cargo_capacity"].to_s
        @starship_consumables ="Consumables: " + @starship_by_id["consumables"].to_s
        @starship_hyperdrive_rating = "Hyperdrive rating: " + @starship_by_id["hyperdrive_rating"].to_s
        @starship_MGLT = "MGLT: " + @starship_by_id["MGLT"].to_s
        @starship_starship_class = "Starship class: " + @starship_by_id["starship_class"].to_s
    elsif params[:yer] == "all-people"
        @all_people = Swapir.get_all_people()
    elsif params[:yer] == "all-films"
        @all_films = Swapir.get_all_films()
    end
    erb :results
end