class Vehicle
  @@vehicles = []
  define_method(:initialize) do |make, model, year|
    @make = make
    @model = model
    @year = year
    @id = @@vehicles.length() + 1
  end
  define_method(:make) do
    @make
  end
  define_method(:model) do
    @model
  end
  define_method(:year) do
    @year
  end
  define_method(:id) do
    @id
  end
  define_singleton_method(:all) do
    @@vehicles
  end
  define_method(:save) do
    @@vehicles.push(self)
  end
  define_singleton_method(:clear) do
    @@vehicles = []
  end
  define_method(:age) do
    Time.now.year - @year
  end
  define_method(:worth_buying?) do
    american_cars = ['Ford', 'Chrysler', 'GM']
    american = american_cars.include?(@make)
    new_enough = self.age < 15
    american.&(new_enough)
  end
  define_singleton_method(:find) do |identification|
    searched_car = nil
    @@vehicles.each() do |car|
      if car.id().eql?(identification.to_i())
        searched_car = car
      end
    end
    searched_car
  end
end
