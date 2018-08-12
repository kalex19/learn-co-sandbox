class GoodDog
end

sparky = GoodDog.new 

#########

module Speak
  def speak(sound)
    puts "#{sound}"
  end
end

class GoodDog
  include Speak
end

class HumanBeing
  include Speak
end

sparky = GoodDog.new
sparky.speak("Arf!")        # => Arf!
bob = HumanBeing.new
bob.speak("Hello!")         # => Hello!

##########

class GoodDog
  def initialize 
    puts "This object was initialized!"
  end
end

sparky = GoodDog.new 
fido = GoodDog.new




