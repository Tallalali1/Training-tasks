# network_tasks.rb

class ArrayOperations
  # Task 1: Find the number of occurrences of numbers in an array and return a hash
  def self.count_occurrences(arr)
    
  end
end

class StringOperations
  # Task 2: Remove consecutive two `ab` after `c` letter from string
  def self.remove_ab_after_c(str)
    
    
  end
end


class NetworkTopology
  network = {
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
  attr_accessor :network

  def initialize(network)
    @network = network || { "buildings" => [] }

    
  end

  # Find and return IDs of all active devices in the network
  def find_active_device_ids
    # append ids to the bottom array
    active_ids = []
    # @network["buildings"].each do |building|
    # end
    active_ids
  end

  # Update the status of device4 in building1, floor2, room3 to active
  def activate_device4

  end

  # Add a new device with ID "F678" to building2, floor1, room4 with status inactive
  def add_device_f678

  end
end
