require 'pry'
require 'rspec'
require './lib/car'
require './lib/dealership'

RSpec.describe Dealership do
    it 'exists' do
        @dealership = Dealership.new('Acme Auto', '123 Main Street')
    
        expect(@dealership).to be_a Dealership
    end

    it 'has readable attributes' do
        @dealership = Dealership.new('Acme Auto', '123 Main Street')
        
        expect(@dealership.name).to eq 'Acme Auto'
        expect(@dealership.address).to eq '123 Main Street'
    end 
    
    it 'has an inventory that can be counted' do
        @dealership = Dealership.new('Acme Auto', '123 Main Street')
        
        expect(@dealership.inventory).to eq []
        expect(@dealership.inventory_count). to eq 0
    end
    
    it 'can add cars to the inventory' do
        @dealership = Dealership.new('Acme Auto', '123 Main Street')
        @car_1 = Car.new('Ford Mustang', 1500, 36)
        @car_2 = Car.new('Toyota Prius', 1000, 48)
        
        @dealership.add_car(@car_1)
        @dealership.add_car(@car_2)
        
        expect(@dealership.inventory).to eq [@car_1, @car_2]
        expect(@dealership.inventory_count).to eq 2
    end
    
    it 'returns true or false if the car has at least one car in its inventory' do
        @dealership = Dealership.new('Acme Auto', '123 Main Street')
        @car_1 = Car.new('Ford Mustang', 1500, 36)
        @car_2 = Car.new('Toyota Prius', 1000, 48)
        @car_3 = Car.new('Toyota Tercel', 500, 48)
        @car_4 = Car.new('Chevrolet Bronco', 1250, 24)
        
        expect(@dealership.has_inventory?).to eq false
        
        @dealership.add_car(@car_1)      
        @dealership.add_car(@car_2)      
        @dealership.add_car(@car_3)      
        @dealership.add_car(@car_4)      
        
        expect(@dealership.has_inventory?).to eq true
    end
    
    it 'can list the cars by make' do
        @dealership = Dealership.new('Acme Auto', '123 Main Street')
        @car_1 = Car.new('Ford Mustang', 1500, 36)
        @car_2 = Car.new('Toyota Prius', 1000, 48)
        @car_3 = Car.new('Toyota Tercel', 500, 48)
        @car_4 = Car.new('Chevrolet Bronco', 1250, 24)
        
        @dealership.add_car(@car_1)      
        @dealership.add_car(@car_2)      
        @dealership.add_car(@car_3)      
        @dealership.add_car(@car_4)  
        
        expect(@dealership.cars_by_make("Toyota")).to eq [@car_2, @car_3]
        expect(@dealership.cars_by_make("Ford")).to eq [@car_1]
    end
    
    it 'returns the total value of dealership inventory' do
        @dealership = Dealership.new('Acme Auto', '123 Main Street')
        @car_1 = Car.new('Ford Mustang', 1500, 36)
        @car_2 = Car.new('Toyota Prius', 1000, 48)
        @car_3 = Car.new('Toyota Tercel', 500, 48)
        @car_4 = Car.new('Chevrolet Bronco', 1250, 24)
        
        @dealership.add_car(@car_1)      
        @dealership.add_car(@car_2)      
        @dealership.add_car(@car_3)      
        @dealership.add_car(@car_4)  
        
        expect(@dealership.total_value).to be 156000
    end
    
    it 'returns a hash of the dealership details' do 
        @dealership = Dealership.new('Acme Auto', '123 Main Street')
        @car_1 = Car.new('Ford Mustang', 1500, 36)
        @car_2 = Car.new('Toyota Prius', 1000, 48)
        @car_3 = Car.new('Toyota Tercel', 500, 48)
        @car_4 = Car.new('Chevrolet Bronco', 1250, 24)
        
        @dealership.add_car(@car_1)      
        @dealership.add_car(@car_2)      
        @dealership.add_car(@car_3)      
        @dealership.add_car(@car_4) 
        expected_hash = {
         'total_value' => 156000,
         'address' => '123 Main Street'   
        } 

        expect(@dealership.details).to eq expected_hash 
    end
end