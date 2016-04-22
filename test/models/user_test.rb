class UserTest < ActiveSupport::TestCase

require 'rails_helper'

describe User do
let(:user) { User.new(first_name: 'Jane', last_name: 'Doe', username: 'janedoe', email: 'jane@doe.come', password: '123456') }

  it 'has a first name' do
    expect(user.first_name).to eq('Jane')
  end

  it 'has a last' do
    expect(user.last_name).to eq('Doe')
  end

  it 'has a username' do
    expect(user.username).to eq('janedoe')
  end

  it 'has an email' do
    expect(user.email).to eq('jane@doe.com')
  end

  it 'has a password' do
    expect(user.password).to eq('123456')
  end
end
end
