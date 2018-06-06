class PokeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "poke_#{current_user}"
  end

  def poke(data)
    if data['username'] != current_user
      ActionCable.server.broadcast("poke_#{data['username']}", { username: current_user })
    end
  end

end
