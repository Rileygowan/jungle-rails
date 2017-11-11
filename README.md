# Jungle

A unscale, hipster-facing online store specializing in apparel, furniture and gadgets.

![Homepage](https://github.com/Rileygowan/jungle-rails/blob/master/app/assets/images/homepage.png?raw=true)
![Cart](https://github.com/Rileygowan/jungle-rails/blob/master/app/assets/images/cart.png?raw=true)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Run `bin/rake db:reset` to create, load and seed db
4. Create .env file for access to admin section
5. Sign up for a Stripe account
6. Put Stripe (test) keys into appropriate .env vars
7. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
