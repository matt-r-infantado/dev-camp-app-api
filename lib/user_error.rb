class UserError < StandardError
  attr_reader :code

  def initialize(message, code)
    @code = code
    # call default standard initializer
    super(message)
  end
end