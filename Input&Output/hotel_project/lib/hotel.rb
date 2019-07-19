require_relative "room"

class Hotel

    # initialize
    #  should accept a name (string) and hash where keys are room names (strings) 
    #  and values are corresponding capacities (numbers)
    #  should set @name
    #  should set @rooms to a new hash where keys are the room names from the 
    #  hash arg and values are Room instances with the specified capacities
    #  should call Room#initialize for each key of the hash arg
    def initialize(name, room_and_cap)
        @name = name
        @rooms = {}

        room_and_cap.each do |room, cap|
            @rooms[room] = Room.new(cap)
        end
    end

    ##name
    #  should get (return) a version of @name where every word is capitalized
    #  should not mutate the original @name
    def name 
        name_arr = @name.split(" ")
        cap_arr = []

        name_arr.each do |ele|
            cap_arr << ele.capitalize
        end

        return cap_arr.join(" ")
    end

    def rooms
        return @rooms
    end

    def room_exists?(name)
        @rooms.has_key?(name)
    end

    # check_in
    #  should accept a person (string) and a room name (string) as args
    #  should call Hotel#room_exists?
    #  when the specified room does not exist should print 'sorry, room does not exist'
    #  when the specified room does exist
    #    should call Room#add_occupant on the correct Room instance
    #    when Room#add_occupant succeeds
    #      should print 'check in successful'
    #    when Room#add_occupant fails
    #      should print 'sorry, room is full'
    def check_in(person, room)
        if room_exists?(room)
           if  @rooms[room].add_occupant(person)
            p @rooms[room]
                p 'check in successful'
           else
                p 'sorry, room is full'
           end
        else 
            p 'sorry, room does not exist'
        end
    end

    # has_vacancy?
    #  when all hotel rooms are full, should return false
    #  when at least 1 room is available, should return true
    def has_vacancy?
        @rooms.values.any? { |room| room.available_space() > 0 }
    end

    # list_rooms
    #  should print out every room name followed by the number of available spaces in that room
    #  should call Room#available_space
    def list_rooms
        @rooms.each do |room_name, cap|  
            puts "#{room_name} #{cap.available_space()}"
        end
    end



        #hotel = Hotel.new("Marriot", { "A"=> 2, "B" => 2 })
        #hotel.check_in("WILSON", "A")
        ##hotel.check_in("Leung", "A")
        #hotel.has_vacancy?
end
