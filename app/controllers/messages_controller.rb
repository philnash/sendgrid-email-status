class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_attributes)
    if @message.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_attributes
    params.require(:message).permit(:to, :subject, :body)
  end
end
