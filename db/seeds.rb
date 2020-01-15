require "rest-client"

response = RestClient.get "https://www.giantbomb.com/api/games/?api_key=eac8ab4d8a6c7c1a7f8f5261d6cd8979bebff5a1&format=json&field_list=name,guid,image,deck"

response_array = JSON.parse(response)["results"]

response_array.each do |game|
  Game.find_or_create_by(
    name: game["name"],
    description: game["deck"],
    image: game["image"]["medium_url"],
  )
end
