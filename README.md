# Kele

Kele is a Ruby Gem API client to provide easy access to and use of the student endpoints of Bloc's API

## Installation
Add this line to your application's Gemfile:
```ruby
gem 'kele'
```
And then execute:

    $ bundle

Or install it yourself as:

    $ gem install kele

## Usage
**To initialize:**

```ruby
$ irb
>> require './lib/kele'
=> true
>> Kele.new("jane@gmail.com", "abc123")
```
**To retrieve a parsed ruby hash of your Bloc.io account information then run:** 

```ruby
$ kele_client.get_me
```

**To retrieve your mentor's current availability:**

```ruby
$ kele_client.get_mentor_availability(mentor_id)
```

**To retrieve your Bloc.io roadmap:** 

```ruby
$ kele_client.get_roadmap(chain_id)
```

**To retrieve information on a particular checkpoint:** 
```ruby
$ kele_client.get_checkpoint(checkpoint_id)
```

**To retrieve your messages:**

```ruby
$ kele_client.get_messages(1) # returns the first page of message threads
$ kele_client.get_messages # returns all message threads
```

**To send a message:** 

```ruby
$ kele.client.create_message(user_id, recipient_id, token, subject, message)
```

**To retrieve the remaining checkpoints:** 
```ruby
$ kele_client.get_remaining_checkpoints(chain_id)
```

## Built With

* json 1.8.3
* httparty 0.13

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
