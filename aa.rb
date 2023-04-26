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



def string_editor(s, t)
    new_s = ""   #new_s = "ac"
    new_t = "" 

    i = 0 
    while i < s.length 
        if s[i] != "#"
            new_s += s[i]  #s[3] = c
        elsif s[i] == "#" && new_s.length == 0 
            new_s = ""
        else
            new_s[-1] = ""
        end
        i += 1
    end

    i = 0 
    while i < t.length 
        if t[i] != "#"
            new_t += t[i]
        elsif t[i] == "#" && new_t.length == 0
            new_t = ""

        else
            new_t[-1] = ""
        end
        i += 1
    end
    # p new_s
    # p new_t
    new_s == new_t

end

p string_editor("a##c", "#a#c")