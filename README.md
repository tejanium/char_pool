# CharPool

This gem will iterate over your chars set, for example if you have chars set `['a', 'b', 'c']`, this gem will produce

```ruby
0  = a
1  = b
2  = c

3  = aa
4  = ab
5  = ac

6  = ba
7  = bb
8  = bc

9  = ca
10 = cb
11 = cc

12 = aaa
13 = aab
14 = aac

15 = aba
16 = abb
17 = abc

18 = aca
19 = acb
20 = acc

...

39 = aaaa

...
```

You got the idea.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'char_pool'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install char_pool

## Usage

```ruby
char_pool = CharPool.new(%w(a b c))
char_pool.start #=> a
char_pool.next  #=> b
char_pool.next  #=> c

char_pool.next  #=> aa
char_pool.next  #=> ab
char_pool.next  #=> ac
```

You can use this as a drop replacement for your URL shortener engine.
No need to store your shortened URL as key and value in database, you can just encode database id as the key.

```ruby
char_pool = CharPool.new(('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a)

char_pool.index_at(100_000_000_000_000) #=> BxHCH9jC

char_pool.index('BxHCH9jC') #=> 100_000_000_000_000
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tejanium/char_pool.

