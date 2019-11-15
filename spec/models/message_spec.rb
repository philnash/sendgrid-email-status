require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { Message.new(to: 'test@example.org', subject: 'New message', body: 'Hello!') }

  it 'is valid with valid attributes' do
    expect(message).to be_valid
  end

  it 'is not valid without a to' do
    message.to = nil
    expect(message).to_not be_valid
  end

  it 'is not valid if to is not an message' do
    message.to = 'test'
    expect(message).to_not be_valid
  end

  it 'is not valid without a subject' do
    message.subject = nil
    expect(message).to_not be_valid
  end

  it 'is not valid without a body' do
    message.body = nil
    expect(message).to_not be_valid
  end

  it 'sets status to "created" by default' do
    expect(message.status).to eq('created')
  end
end
