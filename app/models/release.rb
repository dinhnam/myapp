class Release
  include ActiveModel::Model
  attr_accessor :name

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def to_param
    name
  end
end