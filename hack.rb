#!/usr/bin/ruby

# Enter your words here:
WORDS = %w{
  WEST
  SNOT
  PAIN
  HERO
  HARM
  GUTS
  SALT
  LOTS
  EXIT
  PUTS
  BEGS
  RAGS
}


def get_likeness(word1, word2)
  raise 'words must be the same length' if word1.length != word2.length
  word1.split('').each_index.reject {|i| word1[i] != word2[i]}.count
end

# Assumption: all words must have the same length
def hack(words)
  candidates = words.clone
  word_to_guess = candidates.pop

  while !candidates.empty?
    puts "Try the word: #{word_to_guess}"
    puts "What was the likeness?"

    key_likeness = gets.to_i
    if key_likeness == word_to_guess.length
      puts "Nicee hackeeer!!"
      break
    end

    words.each do |word|
      next if !candidates.include?(word)

      likeness = get_likeness(word_to_guess, word)

      if key_likeness == 0
        candidates -= [word] if likeness > 0
      else
        candidates -= [word] if likeness < key_likeness
      end
    end

    puts "Candidates left: #{candidates.join(', ')}"
    word_to_guess = candidates.pop
  end
end

hack(WORDS)
