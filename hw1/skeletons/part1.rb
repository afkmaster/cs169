def palindrome?(str)
	str.gsub(/\W/,'').downcase == str.gsub(/\W/,'').downcase.reverse
end

def count_words(str)
	temp = str.downcase.split(/\W+/)
	h = {}
	temp.each do |key|
		if h[key] == nil
			h[key] = 1
		else
			h[key] = h[key] + 1
		end
	end
	h
end