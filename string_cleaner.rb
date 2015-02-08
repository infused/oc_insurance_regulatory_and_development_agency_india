module StringCleaner
  def clean_string(s)
    clean = s.dup.encode(Encoding::ASCII, invalid: :replace, undef: :replace, replace: '')

    clean.squeeze!(' ')              # remove extra spaces
    clean.strip!                     # remove leading/trailing whitespace
    clean.gsub!(/,,/, ',')           # remove double commas
    clean.gsub!(/,\ ,/, '')          # remove double commas separated by a space
    clean.gsub!(/^,/, '')            # remove leading commas
    clean.gsub!(/,$/, '')            # remove trailing commas
    clean.gsub!(/,[^\ ]/, ', ')      # add space after commas
    clean.strip
  end
end
