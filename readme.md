# LeetCode Ruby tester

I created this simple repository because writing Ruby in LeetCode's editor is a
less than optimal experience.

## Usage

- Clone this repository
- Run `bundle install`  to install the dependencies
- Run `bundle exec ruby ./spec/<problem_number>_spec.rb`  to run a test.

As I expect people new to Ruby to use this, the reason you run `bundle exec`  is
because otherwise you'll use whatever RSPec version in installed through `gem install`
which can have different settings.

## To-do

- [ ] Make RSpec automatically run tests without having to `require` the lib file.