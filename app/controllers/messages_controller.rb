class MessagesController < ApplicationController

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.where(
      Message.arel_table[:to_id].eq(
      current_user.id
      ).or(
      Message.arel_table[:from_id].eq(
        current_user.id
        )
      )
    )
  end

  # GET /messages/1
  # GET /messages/1.json


  # GET /messages/new
  def new
    @message = Message.new
  end

  # GET /messages/1/edit

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.from_id =current_user.id

    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_path, notice: 'Message was successfully created.' }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /messages/1
  # PATCH/PUT /messages/1.json
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:from_id, :to_id, :body)
    end
end
