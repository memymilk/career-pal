class VideocallsController < ApplicationController
  before_action :generate_twilio_token

  def show
    @videocall = Videocall.find(params[:id])
  end

  def create
    # Calling the method to create a token for this call
    # generate_twilio_token
    #if user.ready >= 2
    #Videocall.new
    #@videocall.user_one = User.where(ready?).sample
    #@videocall.user_two = User.where(ready?).sample
    #user.videocall
  end

  def assign_to_call
    @videocall = Videocall.where(user_two_id: nil)[0]
    if @videocall
      @videocall.user_two = current_user
    else
      @videocall = Videocall.new(user_one: current_user)
    end
    if @videocall.save!
      redirect_to videocall_path(@videocall)
    else
      redirect_to root_path, alert: "couldn't connect to videocall"
    end
  end

  private

  def generate_twilio_token
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    api_key = ENV['TWILIO_API_KEY']
    api_secret = ENV['TWILIO_API_KEY_SECRET']
    # Required for Video
    identity = "user-#{current_user.id}"
    # Create Video grant for our token
    video_grant = Twilio::JWT::AccessToken::VideoGrant.new
    # This room should be dinamic to the room the user is trying to join eg @room.id
    video_grant.room = "room_#{params[:id]}"
    # Create an Access Token
    token = Twilio::JWT::AccessToken.new(
      account_sid,
      api_key,
      api_secret,
      [video_grant],
      identity: identity
    )
    # Generate the token
    @token = token.to_jwt
  end
end
