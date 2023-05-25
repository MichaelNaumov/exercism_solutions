class SimpleCalculator
  class UnsupportedOperation < StandardError;end

  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze

  def self.calculate(first_operand, second_operand, operation)
    begin
      raise SimpleCalculator::UnsupportedOperation if !ALLOWED_OPERATIONS.include?(operation)
      raise ArgumentError if first_operand.is_a?(String) || second_operand.is_a?(String)

      result = first_operand.send(operation.to_sym, second_operand)
      "#{first_operand} #{operation} #{second_operand} = #{result}"
    rescue ZeroDivisionError
      "Division by zero is not allowed."
    end
  end
end
