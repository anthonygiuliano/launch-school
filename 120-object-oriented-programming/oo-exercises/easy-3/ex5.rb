class Television
  def self.manufacturer
    # logic
  end

  def model
    # logic
  end
end

tv = Television.new
# tv.manufacturer # no method error
tv.model

Television.manufacturer
# Television.model # no method error
