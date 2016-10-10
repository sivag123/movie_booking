class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tickets

  GENDER = {"1"=> "male", "2" => "female", "3" => "neutral"}

  def self.create_new_user(params)
    gender = GENDER.invert[params[:gender]].to_i
    begin
      user = User.create(name: params[:name], email: params[:email], password: params[:password],gender: gender)
      user.save!
    rescue Exception => e
      puts "#{e.inspect}"
    end
  end
end
