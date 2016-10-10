class MoviesController < ApplicationController

  def index
    movies = Movie.fetch_movies
    @movies = format_movie_list(movies)
  end

  def screens
    movie_screen_info = Movie.fetch_movie_screens(params[:id])
    @movie_screens = format_movie_screens_list(movie_screen_info)
    puts @movie_screens
  end

  private

  def format_movie_list(movies)
    movie_info = []
    movies.each do |movie|
      movie_info <<
          {
          id: movie.id,
          name: movie.name,
          fee: movie.ticket_fee,
          language: Movie::LANGUAGE.invert[movie.language],
          currency: Movie::CURRENCY.invert[movie.currency],
          crew: movie.crew_info
      }
    end
    movie_info
  end

  def format_movie_screens_list(movie_screen_info)
    movie_screens = movie_screen_info[:movie_screens]
    show_info = movie_screen_info[:show_info]
    theater_screen = {}
    movie_screens.each do |movie_screen|
      theater = Theater.find_by(id: movie_screen.theater_id)
      theater_screen[theater.id] ||= {theater_name: theater.name, theater_city: theater.city}
      (theater_screen[theater.id][:show_times] ||= []) << {
          movie_name: movie_screen_info[:movie_name],
          movie_fee: movie_screen_info[:ticket_fee],
          show_time: show_info[movie_screen.show_id].show_time,
          show_date: movie_screen.show_date,
          remaining_seats: movie_screen.remaining_seats,
          total_capacity: movie_screen.total_seats,
          movie_screen_id: movie_screen.id
      }
    end
    return theater_screen
  end
end
