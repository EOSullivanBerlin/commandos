# this class loads a file of tips for the cat command.
class Cat
  include Flags
  include Tips

  def initialize(filename = 'tips/cat.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(arguments)
    p arguments
    non_flags = arguments.split(" ").reject { |part| part[0] == '-'}
    combine_tips(extract_flags(arguments), non_flags)
  end

  def tips
    @tips.dup
  end

  private

  def combine_tips(flags, non_flags)
    [check_for_b(flags),
     check_for_n(flags),
     check_for_rab(non_flags)]
  end

  def check_for_b(flags)
    return @tips[:b] unless flags.include?('b')
  end

  def check_for_n(flags)
    return @tips[:n] unless flags.include?('n')
  end

  def check_for_rab(arguments)
    return @tips[:>] unless arguments.include?('>')
  end
end
