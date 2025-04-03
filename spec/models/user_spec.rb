require 'rails_helper'

RSpec.describe User,type: :model do
    describe 'validations' do
        it 'is valid with a valid email' do
            user = User.new(email: 'test@example.com', password: "Password134")
            expect(user).to be_valid
        end
        it 'is invalid without an email' do
            user = User.new(email: nil,  password: "Password134")
            expect(user).to_not be_valid
        end
        it 'is invalid with a duplicate email' do
            User.create(email: 'test@example.com')
            duplicate_user = User.new(email: 'test@example.com')
        
            expect(duplicate_user).to_not be_valid
        end
    end
end