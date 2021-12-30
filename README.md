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
  - Problem with word-wraping at some resolutions
- Basket
  - Add icons for BasketItem actions in the products table
  - Show what offers are being applied in case they are applied.
  - Fix bug, once we upload one product's quantity, we cannot update it again.
- Alerts
  - Publish them in the top of the view instead of in the top of the page
  - Cart or bar cannot be clicked when alert is prsent.
### Features
- PricingRule buy-one-get-one-for-free is not exactly what was required.
- Responsive for everything
### CI
- Create automatic GitHub tasks to run CI on each push
- Create automatic GitHub tasks for Code Quality checks (Rubocop)