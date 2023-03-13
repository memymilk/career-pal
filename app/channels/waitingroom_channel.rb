class WaitingroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    waitingroom = []
    stream_for = waitingroom
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end


def toggle_ready_for_call
  if params[:queue_pos] == nil
    # Add user to waiting list at the last position
    @ready_users = User.where.not(queue_pos: nil)
    #  @waiting_users = @ready_users.sort_by { |hash| hash[:queue_pos] }
    current_user.queue_pos = @ready_users.count + 1
  else
    # Remove user from waiting list
    current_user.queue_pos = nil
  end
end
