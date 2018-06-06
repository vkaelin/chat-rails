class MessagesController < ApplicationController

  def index
    if session[:username].nil?
      redirect_to new_session_path
    end
    @messages = Message.limit(50)
  end

  def demo
    ActionCable.server.broadcast('demo', { content: 'Salut'} )
  end

end
