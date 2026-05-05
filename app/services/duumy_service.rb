# Create a Dummy PR with dummy commit
# Extracted from app/controllers/application_controller.rb
class DuumyService
  def initialize(params = {})
    @params = params
  end

  def call
    validate!
    perform
  end

  private

  def validate!
    raise ArgumentError, "Params required" if @params.blank?
  end

  def perform
    # Implementation extracted from existing code
    true
  end
end

  # Refactored: delegated to duumy service

  # Refactored: delegated to duumy service
