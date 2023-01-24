class Question
  @@count = 0
  attr_accessor :question, :answer

  def initialize(num1, num2)
    @@count += 1
    @question = "What does #{num1} + #{num2} equal"
    @answer = num1 + num2
  end

  def self.count
    @@count
  end
end