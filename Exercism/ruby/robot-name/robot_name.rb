class Robot
  attr_accessor :name

  @used_names = []

  def initialize
    @name = Robot.generate_name
  end

  def reset
    @name = Robot.generate_name
  end

  def self.generate_name
    # letters = (0..1).map { (65 + rand(26)).chr }.join
    letters_part = (0..1).map { (65 + rand(26)).chr }.join
    digits_part = rand(100..999).to_s
    name = letters_part << digits_part
    name = generate_name if @used_names.include?(name)
    @used_names << name
    name
  end

  def self.forget
  end
end
