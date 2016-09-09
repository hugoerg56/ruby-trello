module Trello
  # A Comment is a string with a creation date; it resides inside a Card and belongs to a User.
  #
  # @!attribute [r] action_id
  #   @return [String]
  # @!attribute [r] text
  #   @return [String]
  # @!attribute [r] date
  #   @return [Datetime]
  class Update < BasicData
    register_attributes :action_id, :text, :date, :member_creator_id,
      readonly: [ :action_id, :text, :date, :member_creator_id ]
    validates_presence_of :action_id, :text, :date, :member_creator_id
    validates_length_of   :text,        in: 1..16384


    def board
      Board.from_response client.get("/actions/#{action_id}/board")
    end

    def card
      Card.from_response client.get("/actions/#{action_id}/card")
    end
    
    def list
      List.from_response client.get("/actions/#{action_id}/list")
    end

  end
end
