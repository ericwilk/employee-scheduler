class Engineer < Employee
  attr_accessible :support_hero
end

def support_hero?
  this.support_hero
end
