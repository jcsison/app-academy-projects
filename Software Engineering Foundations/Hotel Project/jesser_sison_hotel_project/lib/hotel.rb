require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = rooms.to_a.each_with_object({}) do |array, hash|
      hash[array[0]] = Room.new(array[1])
    end
  end

  def name
    @name.split.map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.has_key?(room_name)
  end

  def check_in(person, room_name)
    if !self.room_exists?(room_name)
      puts "I'm sorry, room does not exist."
    elsif !@rooms[room_name]&.add_occupant(person)
      puts "I'm sorry, room is full."
    else
      puts "Check in successful."
    end
  end

  def has_vacancy?
    @rooms.any? { |room_name, room| !room.full? }
  end

  def list_rooms
    @rooms.each do |room_name, room|
      puts "%s: %i" % [room_name, room.available_space.to_i]
    end
  end
end
