class Triangle

  attr_reader :s1, :s2, :s3, :side_array


  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    @side_array = [s1, s2, s3]
  end

  def valid_triangle?
    if self.side_array.find { |value| value <= 0 }
      raise TriangleError
    elsif self.s1 + self.s2 <= self.s3 || self.s1 + self.s3 <= self.s2 || self.s2 + self.s3 <= self.s1
      raise TriangleError
    end
  end

  def kind
    self.valid_triangle?
  
    if self.side_array.uniq.length == 1
      :equilateral
    elsif self.side_array.uniq.length == 2
      :isosceles
    else 
      :scalene
    end
  end

  class TriangleError < StandardError
  end

end
