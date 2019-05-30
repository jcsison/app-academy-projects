require_relative "room"

class Hotel
    def initialize(name, rooms)
        @name = name
        @rooms = rooms.to_a.each_with_object({}) { |array, hash| hash[array[0]] = Room.new(array[1]) }
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
        print "I'm sorry, room does not exist." unless self.room_exists?(room_name)
        print "I'm sorry, room is full." unless @rooms[room_name]&.add_occupant(person)
        print "Check in successful."
    end

    def has_vacancy?
        @rooms.any? { |room_name, room| !room.full? }
    end

    def list_rooms
        @rooms.each { |room_name, room| print room_name + ": " + room.available_space.to_s + "\n" }
    end
end
