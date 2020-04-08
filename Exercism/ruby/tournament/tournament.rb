class Team
  attr_accessor :name, :mp, :w, :d, :l, :p

  def initialize(name)
    @name = name
    @mp, @w, @d, @l, @p = 0, 0, 0, 0, 0
  end

  def win
    @mp += 1
    @w += 1
    @p += 3
  end

  def lose
    @mp += 1
    @l += 1
  end

  def draw
    @mp += 1
    @d += 1
    @p += 1
  end
end

class Tournament
  LINE_OFFSET = 31

  class << self
    def tally(matches)
      return default_header if matches.chomp.empty?

      @teams = extract_teams(matches)

      matches.each_line do |line|
        team_a_name, team_b_name, @result = line.split(";")

        @team_a, @team_b = find_or_create_team(team_a_name), find_or_create_team(team_b_name)
        process_results
      end

      default_header << order_teams(@teams).map { |t| template_line(t) }.join
    end

    def extract_teams(results)
      team_names = []

      results.each_line do |match|
        team_names += match.split(";").take(2)
      end

      team_names.uniq.map! { |team_name| Team.new(team_name) }
    end

    def find_or_create_team team_name
      @teams.find { |t| t.name == team_name } || Team.new(team_name)
    end

    def default_header
      "Team".ljust(LINE_OFFSET, " ") << "| MP |  W |  D |  L |  P\n"
    end

    def order_teams teams
      points_equal = teams.each_cons(2).all? { |a, b| a.p == b.p }

      if points_equal
        teams.sort_by { |a| a.name }
      else
        teams.sort_by { |a| a.p }.reverse
      end
    end

    def template_line_prefix team
      team.name.ljust(LINE_OFFSET, " ")
    end

    def template_line team
      template_line_prefix(team) << "| #{prepare_point(team.mp)}| #{prepare_point(team.w)}| #{prepare_point(team.d)}| #{prepare_point(team.l)}| #{prepare_point(team.p)}".strip << "\n"
    end

    def prepare_point point
      point.to_s.center(3)
    end

    def process_results
      @result = @result.chomp

      case @result
      when "win"
        @team_a.win
        @team_b.lose
      when "loss"
        @team_a.lose
        @team_b.win
      when "draw"
        @team_a.draw
        @team_b.draw
      end
    end
  end
end

