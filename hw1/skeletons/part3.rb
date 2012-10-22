def combine_anagrams(words)
	h = {}
	words.each do |key|
		temp = key.downcase.chars.sort.join
		if h[temp] == nil
			h[temp] = [key]
		else
			h[temp] = h[temp].push(key)
		end
	end
	h.values
end