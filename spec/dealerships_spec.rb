require('rspec')
require('dealership')

describe('Dealership') do
  before() do
    Dealership.clear()
  end
  describe('#name') do
    it('returns the name of the dealership') do
      test_dealership = Dealership.new('bacon blitz')
      expect(test_dealership.name()).to(eq('bacon blitz'))
    end
  end
  describe('#id') do
    it('returns the id of the dealership') do
      test_dealership = Dealership.new('Ford')
      test_dealership.save()
      expect(test_dealership.id()).to(eq(1))
    end
  end
  describe('#cars') do
    it('returns the cars of the dealership, initially an empty array') do
      test_dealership = Dealership.new('Ford')
      expect(test_dealership.cars()).to(eq([]))
    end
  end
  describe('.all') do
    it('is empty at first, but returns all the created dealerships') do
      expect(Dealership.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('adds a dealership to the array fo saved dealerships') do
      test_dealership = Dealership.new('Toyota')
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end
  describe('.clear') do
    it('empties out the array of saved dealerships') do
      Dealership.new('Honda').save()
      Dealership.clear()
      expect(Dealership.all()).to(eq([]))
    end
  end
  describe('.find') do
    it('returns a dealership by its id number') do
      test_dealership = Dealership.new('Toyota')
      test_dealership.save()
      test_dealership2 = Dealership.new("Toyota")
      test_dealership2.save()
      expect(Dealership.find(2)).to(eq(test_dealership2))
    end
  end
  describe('#add_vehicle') do
    it('adds a new vehicle to the dealership') do
      test_dealership = Dealership.new("Cars on Cars")
      test_vehicle = Vehicle.new('Ford', 'Pinto', 1989)
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end
end
