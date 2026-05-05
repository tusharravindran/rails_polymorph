require "rails_helper"

RSpec.describe DuumyService do
  subject(:service) { described_class.new }

  it "is defined" do
    expect(service).to be_a(described_class)
  end
end
