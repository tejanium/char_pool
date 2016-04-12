# CharPool

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/char_pool`. To experiment with that code, run `bin/console` for an interactive prompt.

This gem will iterate over your chars set, for example if you have chars set ['a', 'b', 'c'], this gem will produce

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

21 = baa
22 = bab
23 = bac

24 = bba
25 = bbb
26 = bbc

27 = bca
28 = bcb
29 = bcc

30 = caa
31 = cab
32 = cac

33 = cba
34 = cbb
35 = cbc

36 = cca
37 = ccb
38 = ccc

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

char_pool.index_of(9)  #=> ca
char_pool.index_of(39) #=> aaaa

char_pool.index('ca')   #=> 9
char_pool.index('aaaa') #=> 39
```

TODO: more example and usage

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tejanium/char_pool.

