require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name, id)
    super(age, name)
    @id = id if id
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
