# README

## Basic Functionality

- It has a UI where the user can add products to a cart and compute the total price including discounts
- It is usable while remaining as simple as possible
- It is easily extendable

## Known Assumptions Made

  1. No Checkout Functionality.
  2. It's just a basic UI without much design.
  3. Each product can avail of one discount at a time(to simplify the implementation)
  4. The admin section for adding new products or adding or editing discounts is not implemented. Everything is implemented through seeds.rb

### Requirements

- Ruby 3.2.2

### Installation

- Clone the repository
- Install the gems `bundle install`
- Compile css `yarn install`
- Run the `rails db:migrate`

### Start the server

  `bin/dev`

### Launch tests

  `rails db:migrate RAILS_ENV=test`
  `rails db:seed RAILS_ENV=test`
  `rspec`
