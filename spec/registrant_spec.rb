require 'pry'
require './lib/registrant'
require './lib/facility'

RSpec.describe Registrant do
    before(:each) do
        @registrant_1 = Registrant.new('Bruce', 18, true )
        @registrant_2 = Registrant.new('Penny', 15 )
    end

    it 'exists' do

        expect(@registrant_1).to be_an_instance_of(Registrant)
        expect(@registrant_2).to be_an_instance_of(Registrant)
    end

    it 'has attributes' do

        expect(@registrant_1.name).to eq("Bruce")
        expect(@registrant_2.name).to eq("Penny")
        expect(@registrant_1.age).to eq(18)
        expect(@registrant_2.age).to eq(15)
        expect(@registrant_1.permit?).to eq(true)
        expect(@registrant_2.permit?).to eq(false)
    end

    it 'has license data' do

        expect(@registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(@registrant_2.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
    end

    it 'can earn a permit' do
        @registrant_2.earn_permit

        expect(@registrant_2.permit?).to eq(true)
    end

    it 'can return license and permit data' do
        registrant_1 = Registrant.new('Bruce', 18, true )
        registrant_2 = Registrant.new('Penny', 16 )
        registrant_3 = Registrant.new('Tucker', 15 )
        facility_1 = Facility.new({name: 'Albany DMV Office', address: '2242 Santiam Hwy SE Albany OR 97321', phone: '541-967-2014' })
        facility_2 = Facility.new({name: 'Ashland DMV Office', address: '600 Tolman Creek Rd Ashland OR 97520', phone: '541-776-6092' })

        expect(registrant_1.license_data).to eq({:written=>false, :license=>false, :renewed=>false})
        expect(registrant_1.permit?).to eq(true)
    end
end