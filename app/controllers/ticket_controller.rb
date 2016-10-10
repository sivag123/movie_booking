class TicketController < ApplicationController

  def book_ticket
    if current_user.present? && MovieScreen.valid_to_book(params[:id])
      ms = MovieScreen.find_by(id: params[:id])
      movie = Movie.find_by(id: ms.movie_id)
      if !MovieScreen.check_if_full(params[:id])
        Ticket.book_ticket(user_id: current_user.id,
        movie_screen_id: params[:id],
        quantity: params[:ticket][:quantity],
        price: movie.ticket_fee,
        promo_code: params[:ticket][:promo_code])
      end
      flash[:success] = "Ticket created successfully"
      render :template => 'success.html.erb'
    else
      flash[:error] = "Ticket not created"
      render :template => 'failure.html.erb'
    end
  end

  def booking
    ms = MovieScreen.find_by(id: params[:id])
  end

  def cancel_ticket
    if current_user.present?
      Ticket.cancel_ticket(ticket_id: params[:id])
    end
    redirect_to '/user/bookings'
  end

end
