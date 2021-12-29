# About the repo
This repo contains the simulation of an e-commerce.

In the e-commerce there is:
- A home page with not so much information
- Products page with 3 possible products to buy
- Basket page in which you can see the things you are going to buy
- A bar that allows you to move between the different pages

## State
This is only a prototype, so there are still many things to improve, some ToDo things are:
### Testing
- Add different traits to Basket:
  - Trait `:with_items`: Array of BasketItems
  - Trait `:empty`: The BasketItems relation is an empty array
- Basket factory still needs a relation with Product
- Specs for controllers
- Specs for views
- Review specs for all models. Probably there are some validations without test
### Frontend
- Nav Bar
  - Adding some kind of feedback in the Cart icon when some products are added in the "Products" section
- Products
  - Adding unitary price in product cards
  - Bit of re-styling
- Basket
  - Add icons for BasketItem actions in the products table
### Features
- Integrate PricingRules with the Basket logic
- Responsive for everything
### CI
- Create automatic GitHub tasks to run CI on each push
- Create automatic GitHub tasks for Code Quality checks (Rubocop)