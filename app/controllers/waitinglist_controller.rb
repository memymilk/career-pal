class WaitinglistController < ApplicationController

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

  def new_queue_pos;end

  def create_queue_pos;end

  def update_queue_pos;end

  def destroy_queue_pos;end

end
