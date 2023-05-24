class LogLineParser
  def initialize(line)
    @line = line.gsub(/\n|\r|\t/, "")
  end

  def message
    @line.split("]: ").last.strip
  end

  def log_level
    @line.match(/\[\w+\]/).to_s.gsub(/\[|\]/, "").downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end
