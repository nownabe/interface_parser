# InterfaceParser
To parse interfaces from linux commands: ifconfig and ip.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'interface_parser'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install interface_parser

## Usage
```ruby
pp InterfaceParser.parse_ifconfig(`ifconfig`)

# =>
{"eno16777984"=>
  {"ipv4"=>"192.168.1.4",
   "netmask"=>"255.255.255.0",
   "broadcast"=>"192.168.1.255",
   "ipv6"=>"xxx",
   "mac"=>"06:a8:cc:02:34:41"},
 "eno33554976"=>
  {"ipv4"=>nil,
   "netmask"=>nil,
   "broadcast"=>nil,
   "ipv6"=>nil,
   "mac"=>"06:0a:a4:02:34:81"},
 "eno50332200"=>
  {"ipv4"=>"10.3.0.13",
   "netmask"=>"255.255.248.0",
   "broadcast"=>"10.3.7.255",
   "ipv6"=>"fe80::3aff:fecc:113",
   "mac"=>"02:00:3a:cc:01:13"},
 "lo"=>
  {"ipv4"=>"127.0.0.1",
   "netmask"=>"255.0.0.0",
   "broadcast"=>nil,
   "ipv6"=>"::1",
   "mac"=>nil}}

pp InterfaceParser.parse_ip_addr(`ip addr`)

# =>
{"lo"=>
  {"index"=>"1",
   "loopback"=>"00:00:00:00:00:00",
   "mac"=>nil,
   "ipv4"=>nil,
   "ipv4_prefix"=>nil,
   "broadcast"=>nil,
   "ipv6"=>"::1",
   "ipv6_prefix"=>"/128"},
 "eno16777984"=>
  {"index"=>"2",
   "loopback"=>nil,
   "mac"=>"06:a8:cc:02:34:41",
   "ipv4"=>"192.168.1.4",
   "ipv4_prefix"=>"/24",
   "broadcast"=>"192.168.1.255",
   "ipv6"=>"xxx",
   "ipv6_prefix"=>"/64"},
 "eno33554976"=>
  {"index"=>"3",
   "loopback"=>nil,
   "mac"=>"06:0a:a4:02:34:81",
   "ipv4"=>nil,
   "ipv4_prefix"=>nil,
   "broadcast"=>nil,
   "ipv6"=>"fe80::40a:a4ff:fe02:3481",
   "ipv6_prefix"=>"/64"},
 "eno50332200"=>
  {"index"=>"4",
   "loopback"=>nil,
   "mac"=>"02:00:3a:cc:01:13",
   "ipv4"=>"10.3.0.13",
   "ipv4_prefix"=>"/21",
   "broadcast"=>"10.3.7.255",
   "ipv6"=>"fe80::3aff:fecc:113",
   "ipv6_prefix"=>"/64"}}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/interface_parser/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
