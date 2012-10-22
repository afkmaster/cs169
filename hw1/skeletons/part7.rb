class CartesianProduct
	include Enumerable
	def initialize(x, y)
  		@x = x
  		@y = y
  	end

  	def each
  		return to_enum unless block_given?
  		if !@x.empty? and !@y.empty?
  			@x.each do |xval|
  				@y.each do |yval|
  					yield [xval, yval]
  				end
  			end
  		end
  		self
  	end
end