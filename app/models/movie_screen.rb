class MovieScreen < ActiveRecord::Base
  belongs_to :theaters
  belongs_to :movies

  def self.increment_booking_count(movie_screen_id, quantity)
    mvs = MovieScreen.find_by(id: movie_screen_id)
    mvs.remaining_seats = mvs.remaining_seats.to_i - quantity.to_i
    mvs.booked_seats = mvs.booked_seats.to_i + quantity.to_i
    mvs.save!
  end

  def self.decrement_booking_count(movie_screen_id, quantity)
    mvs = MovieScreen.find_by(id: movie_screen_id)
    mvs.remaining_seats = mvs.remaining_seats.to_i + quantity.to_i
    mvs.booked_seats = mvs.booked_seats.to_i - quantity.to_i
    mvs.save!
  end

  def self.check_if_full(movie_screen_id)
    mv = MovieScreen.find_by(id: movie_screen_id)
    if mv.booked_seats.to_i >= mv.total_seats.to_i
      return true
    end
    return false
  end

  def self.valid_to_book(movie_screen_id)
    mv = MovieScreen.find_by(id: movie_screen_id)
    show = Show.find_by(id: mv.show_id)
    date = mv.show_date
    time = show.show_time
    dt = DateTime.new(date.year, date.month, date.day, time.hour, time.min, time.sec, time.zone)
    dt < Time.now ? false : true
  end
end
