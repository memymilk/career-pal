class VideoCallChannel < ApplicationCable::Channel
  def subscribed
    video_call = Videocall.find(params[:id])
    stream_for video_call
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
