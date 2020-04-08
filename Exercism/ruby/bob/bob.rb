class Bob
  def self.hey(remark)
    # question?(remark) || forceful_question?(remark) || yell?(remark) || "Whatever."

    if remark == remark.upcase && remark.strip[-1] == "?" && remark.count("a-zA-Z") > 0
      "Calm down, I know what I'm doing!"
    elsif remark == remark.upcase && remark.count("a-zA-Z") > 0
      "Whoa, chill out!"
    elsif remark.strip[-1] == "?"
      "Sure."
    elsif remark.gsub(/[^a-zA-Z0-9\-]/,"").empty?
      "Fine. Be that way!"
    else
      "Whatever."
    end
  end
end
