class Car 
    attr_reader :make, :model, :make_model, :monthly_payment, :loan_length, :color, :total_cost

    def initialize(make_model, monthly_payment, loan_length)
        make_model = make_model.split(" ")
        @make = make_model[0]
        @model = make_model[1]
        @monthly_payment = monthly_payment
        @loan_length = loan_length
        @color = nil
    end

    def total_cost
        @monthly_payment * @loan_length
    end

    # def paint(color)
    #     @color = color
    # end

    def paint!(color)
        @color = color
    end
end