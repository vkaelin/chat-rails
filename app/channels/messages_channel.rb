class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "messages"
  end

  def speak(data)
    message = Message.new(username: current_user, content: data['message'])
    if message.valid?
      message.save
      html = ApplicationController.render(partial: 'messages/message', locals: { message: message })
      ActionCable.server.broadcast('messages', message: html)
    else
      ActionCable.server.broadcast("errors_#{current_user}", errors: message.errors.full_messages)
    end

  end
end
