require "json"
require "open-uri"

puts "Cleaning database..."
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all


url = "https://tmdb.lewagon.com/movie/top_rated"
movies_serialized = URI.parse(url).read
movies = JSON.parse(movies_serialized)


puts "Creating movies..."

movies["results"].each do |movie|
  Movie.create(title: movie["original_title"], overview: movie["overview"], poster_url: "https://image.tmdb.org/t/p/original/#{movie["poster_path"]}.jpg", rating: movie["vote_average"])
end


# 3. Display a message 🎉
puts "Finished! Created #{Movie.count} movies."