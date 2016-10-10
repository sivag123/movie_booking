class Ticket < ActiveRecord::Base
  belongs_to :users
  belongs_to :movie_screens

  def self.book_ticket(params)
    begin
      amount = calculate_amounts(params)
      params.merge!(amount)
      Ticket.create_new_ticket(params)
    rescue Exception => e

    end
  end

  def self.fetch_user_tickets(user_id)
    ticket_arr = []
    tickets = Ticket.where(user_id: user_id).order(:created_at).reverse_order
    mvs = tickets.collect(&:movie_screen_id)
    movie_screens = MovieScreen.where(id: mvs)
    theater_ids = movie_screens.collect(&:theater_id)
    movie_ids = movie_screens.collect(&:movie_id)
    show_ids =  movie_screens.collect(&:show_id)
    movie_screens = movie_screens.index_by(&:id)
    theaters = Theater.where(id: theater_ids).index_by(&:id)
    movies = Movie.where(id: movie_ids).index_by(&:id)
    shows = Show.where(id: show_ids).index_by(&:id)

    tickets.each do |ticket|
      movie_screen = movie_screens[ticket.movie_screen_id]
      theater = theaters[movie_screen.theater_id]
      movie = movies[movie_screen.movie_id]
      show = shows[movie_screen.show_id]
      ticket_arr <<
      {
          id: ticket.id,
          movie: movie.name,
          theater_name: theater.name,
          theater_city: theater.city,
          seats: ticket.quantity,
          amount: ticket.total_amount,
          language: Movie::LANGUAGE.invert[movie.language],
          show_time: show.show_time,
          active: ticket.active == 1 ? true : false
      }
    end

    ticket_arr
  end


  def self.cancel_ticket(params)
    t = Ticket.find_by(id: params[:ticket_id])
    t.active = 0
    t.save!
    MovieScreen.decrement_booking_count(t.movie_screen_id, t.quantity)
  end

  def self.create_new_ticket(params)

      t = Ticket.new(
          user_id: params[:user_id],
          movie_screen_id: params[:movie_screen_id],
          price: params[:price].to_f,
          quantity: params[:quantity],
          sub_total: params[:sub_total].to_f,
          discount_amount: params[:discount_amount].to_f,
          total_amount: params[:total_amount].to_f,
          promo_code: params[:promo_code]
      )
      t.save!
      MovieScreen.increment_booking_count(params[:movie_screen_id], params[:quantity])

  end

  private

  def self.calculate_amounts(params)
    {
        sub_total: params[:price] * params[:quantity].to_f,
        discount_amount: params[:discount_amount].to_f,
        total_amount: params[:price] * params[:quantity].to_f - params[:discount_amount].to_f
    }
  end
end
