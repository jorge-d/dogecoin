module DogeCoin
  class InvalidAddress < StandardError
    def intialize msg = "Not a valid address"
      super msg
    end
  end
end
