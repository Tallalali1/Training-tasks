require_relative 'test'

RSpec.describe ArrayOperations do
  describe '.count_occurrences' do
    it 'returns a hash with the count of each number in the array' do
      input = [1, 3, 1, 5, 4, 3, 5, 5]
      input2 = [1, 3, 1, 5, 4, 3, 3, 5]
      expected_output = { 1 => 2, 3 => 2, 4 => 1, 5 => 3 }
      expected_output2 = { 1 => 2, 3 => 3, 4 => 1, 5 => 2 }
      expect(ArrayOperations.count_occurrences(input)).to eq(expected_output)
      expect(ArrayOperations.count_occurrences(input2)).to eq(expected_output2)
    end
  end
end

RSpec.describe StringOperations do
  describe '.remove_ab_after_c' do
    it 'removes consecutive "ab" following "c" from the string' do
      input = "abcababcdabab"
      input2 = "abcabababcabdabab"
      expected_output = "abccdabab"
      expect(StringOperations.remove_ab_after_c(input)).to eq(expected_output)
      expect(StringOperations.remove_ab_after_c(input2)).to eq(expected_output)
    end
  end
end

RSpec.describe NetworkTopology do
  let(:network_data) do
    {
      "buildings" => [
        {
          "name" => "building1",
          "floors" => [
            {
              "name" => "floor1",
              "rooms" => [
                {
                  "name" => "room1",
                  "devices" => [
                    { "id" => "A123", "status" => "active" },
                    { "id" => "B456", "status" => "inactive" }
                  ]
                },
                {
                  "name" => "room2",
                  "devices" => [
                    { "id" => "C789", "status" => "active" }
                  ]
                }
              ]
            },
            {
              "name" => "floor2",
              "rooms" => [
                {
                  "name" => "room3",
                  "devices" => [
                    { "id" => "D012", "status" => "inactive" }
                  ]
                }
              ]
            }
          ]
        },
        {
          "name" => "building2",
          "floors" => [
            {
              "name" => "floor1",
              "rooms" => [
                {
                  "name" => "room4",
                  "devices" => [
                    { "id" => "E345", "status" => "active" }
                  ]
                }
              ]
            }
          ]
        }
      ]
    }
  end

  let(:network) { NetworkTopology.new(network_data) }

  describe '#find_active_device_ids' do
    it 'returns the IDs of all active devices' do
      expect(network.find_active_device_ids).to eq(["A123", "C789", "E345"])
    end
  end

  describe '#activate_device4' do
    it 'updates the status of device4 in building1, floor2, room3 to active' do
      network.activate_device4
      device4 = network_data["buildings"]
                   .find { |b| b["name"] == "building1" }["floors"]
                   .find { |f| f["name"] == "floor2" }["rooms"]
                   .find { |r| r["name"] == "room3" }["devices"]
                   .find { |d| d["id"] == "D012" }

      expect(device4["status"]).to eq("active")
    end
  end

  describe '#add_device_f678' do
    it 'adds a new device with ID F678 to building2, floor1, room4 with status inactive' do
      network.add_device_f678
      device_f678 = network_data["buildings"]
                     .find { |b| b["name"] == "building2" }["floors"]
                     .find { |f| f["name"] == "floor1" }["rooms"]
                     .find { |r| r["name"] == "room4" }["devices"]
                     .find { |d| d["id"] == "F678" }

      expect(device_f678).not_to be_nil
      expect(device_f678["status"]).to eq("inactive")
    end
  end
end
