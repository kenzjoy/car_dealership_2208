class Dealership 
    attr_reader :name, :address, :inventory, :inventory_count

    def initialize(name, address)
        @name = name
        @address = address
        @inventory = []
        @inventory_count = 0
    end

    def add_car(car)
        @inventory_count += 1
        @inventory << car
    end

    def has_inventory?
        if @inventory_count > 0
            true
        else
            false
        end
    end

    def cars_by_make(make)
        cars = [] 
        @inventory.each do |car|
            if car.make == make
                cars << car 
            end
        end
        cars 
    end

    def total_value
        value = 0
        @inventory.each do |car|
            value += car.total_cost
        end
        value
    end

    def details
        dealership_details = {
            'total_value' => total_value,
            'address' => @address
        }
    end

    def average_price_of_car
        avg = total_value / @inventory_count
        avg.to_s.insert(2, ',')
    end

    def cars_sorted_by_price
        sorted = @inventory.sort_by do |car|
            car.total_cost
        end

    def inventory_hash
        inv_hash = Hash.new(0)
        
    end

    end
end