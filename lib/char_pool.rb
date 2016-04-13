require 'char_pool/version'

class CharPool
  def initialize(char_pool)
    raise(ArgumentError, 'Pool should be array') unless char_pool.is_a?(Array)
    raise(ArgumentError, 'Pool cannot be empty') if char_pool.empty?

    @char_pool = char_pool.uniq.map &:to_s
  end

  def start(current = @char_pool.first)
    @current_index = index(current)

    current
  end

  def print
    index_at @current_index
  end

  def next
    @current_index = 0 and return print if @current_index.nil?

    @current_index += 1

    print
  end

  def index_at(number)
    encode(number).map{|i| @char_pool[i]}
                  .join
  end

  def index(string)
    decode(string)
  end

  private
    def decode(string)
      return string.length if @char_pool.length == 1

      array = string.split('').map do |char|
                @char_pool.index(char)
              end

      length = @char_pool.length
      offset = sum_of_geometry(length, array.length - 1)

      index_from_offset = count_array(array)
      number = offset + index_from_offset
    end

    def encode(number)
      return [0]          if number.zero?
      return [0] * number if @char_pool.length == 1

      seq_index = 0
      length    = @char_pool.length

      while number >= sum_of_geometry(length, seq_index)
        seq_index = seq_index + 1
      end

      offset = sum_of_geometry(length, seq_index - 1)

      index_from_offset = number - offset

      build_array(seq_index, index_from_offset)
    end

    def sum_of_geometry(length, index)
      first = ratio = length

      # https://en.wikipedia.org/wiki/Geometric_series#Sum
      first * ((1 - (ratio ** index)) / ( 1 - ratio ))
    end

    def build_array(length, number)
      return [number] if length == 1

      array = []

      while number != 0
        array.unshift number % @char_pool.length
        number = number / @char_pool.length
      end

      ([0] * (length - array.length)) + array
    end

    def count_array(array)
      array.reverse.each.with_index.reduce(0) do |sum, (num, index)|
        sum + (num * (@char_pool.length ** index))
      end
    end
end
