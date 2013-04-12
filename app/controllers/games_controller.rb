class GamesController < ApplicationController
  def create
    channel = Channel.find(params[:channel])
    @game = Game.create(name:channel.name)
    @game.users << @current_user
    @game.current_player = @current_user.username
    @game.save
  end

  def join_game
    game = Game.find(params[:game_id])
    game.users << @current_user
    Pusher.trigger(params[:channel], "join", "#{@current_user.username}")
    render :nothing => true
  end
end