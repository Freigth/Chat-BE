# frozen_string_literal: true

module Api
  class MessagesController < ApplicationController
    def create
      message = message_params.to_h.with_indifferent_access
      ActionCable.server.broadcast('somechannel', {
        body: message[:body],
      })
    end

    private

    def message_params
      params.require(:message).permit(:body, :chatroom_id)
    end
  end
end
