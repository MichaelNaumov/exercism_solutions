class Array
	def accumulate
		return self.dup unless block_given?

		arr = []
		
		self.each do |elem|
			arr << yield(elem)
		end

		arr
	end
end