def pattern?(pattern, str)
    hash_1 = Hash.new(Array.new)
    hash_2 = Hash.new(Array.new)

    pattern.each_char.with_index do |char, i|
        hash_1[char] += [i]
    end

    eles = str.split(" ")

    eles.each_with_index do |ele, i|
        hash_2[ele] += [i]
    end
    # p hash_1
    # p hash_2
    (0...pattern.length).each do |i|
        if hash_1[pattern[i]] == hash_2[eles[i]]
            return true
        end
    end
    false
end

# a - 0, 3
# b - 1, 2

# dog - 0, 3
# cat - 1, 2

pattern1 = "aaaa"
str1 = "dog cat cat dog"

# p pattern?(pattern1, str1)
