class HomeController < ApplicationController
  def index
  end

  def register
  end

  def login
    puts params
    # current_user = User.find_by(email:params[])
  end

  def register_new_user
    puts "params"
    puts params
    User.create_new_user(params[:user])
    redirect_to "/users/sign_in"
  end

  def bookings
    if current_user.present?
      @ticket_array = Ticket.fetch_user_tickets(current_user.id)
    end
  end
end
