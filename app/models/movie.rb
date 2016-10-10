class Movie < ActiveRecord::Base
  has_many :movie_screens

  LANGUAGE = {"Hindi" => 1, "Tamil" => 2, "English" => 3}
  CURRENCY = {"INR" => 1}

  def self.fetch_movies
    movies = Movie.all.order(:created_at).reverse_order
  end

  def self.fetch_movie_screens(movie_id)
    movie = Movie.find_by(id: movie_id)
    movie_screens = movie.movie_screens
    show_ids = movie_screens.collect(&:show_id)
    show_info = Show.where(id: show_ids).index_by(&:id)
    {movie_screens: movie_screens, show_info: show_info, movie_name: movie.name, ticket_fee: movie.ticket_fee}
  end


end
