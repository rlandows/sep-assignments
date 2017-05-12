# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    self.members << person

  end

  def leave(person)
    self.members.delete(person)

  end

  def front
    self.members[0]

  end

  def middle
    length = self.members.length
    middle = (length/2).floor
    self.members[middle]

  end

  def back
    self.members[-1]
  end

  def search(person)
    if index(person).class == Fixnum
      return person
    else
      return index(person)
    end
  end

  private

  def index(person)
    self.members.each do |name, idx|
      if person == name
        return name
      end
    end
    return nil
  end

end
