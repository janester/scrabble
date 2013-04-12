class ChannelsController < ApplicationController
  def create
    @channel = Channel.create(params[:channel])
    @channels = Channel.order(:name)
  end

  def refresh
    @channels = Channel.order(:name)
  end

  def correct_chat
  end

  def send_chat
    if params[:channel] != ""
      Pusher.trigger(params[:channel], "chat", "#{@current_user.username}: #{params[:chat_text]}")
    end
    render :nothing => true
  end

  def show_game
    @channel = Channel.where(name:params[:channel]).first
    @game = Game.where(name:@channel.name).first
  end
end
