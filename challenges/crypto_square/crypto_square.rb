class Crypto
  # accept input when initialized
  # normalize text
  # determine length
  # determine number of columns based on length
  # output first character in each column, followed by the second, etc.

  def initialize(text)
    @normalized_plaintext = text.gsub(/[^a-zA-Z0-9]/, '').downcase
  end

  def normalize_plaintext
    @normalized_plaintext
  end

  def size
    Math::sqrt(normalize_plaintext.length).ceil
  end

  def plaintext_segments
    @normalized_plaintext.scan(/.{1,#{size}}/)
  end

  def ciphertext
    encode_plaintext
  end

  def normalize_ciphertext
    encode_plaintext(' ')
  end

  def right_pad(string, size_limit)
    return string if string.size == size_limit
    string += ' ' * (size_limit - string.size)
  end

  def encode_plaintext(delimiter='')
    padded_segments = plaintext_segments.map do |string|
      right_pad(string, size)
    end
    padded_segments.map(&:chars)
                   .transpose
                   .map(&:join)
                   .map(&:strip)
                   .join(delimiter)
  end
end
