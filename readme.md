### One-to-Many Challenges

Imagine we're creating an online order system for an e-commerce site. A customer loads up their shopping cart with *items*, and a new *order* is created when they check out. So we know we'll have an `Order` model and an `Item` model (don't worry about the customer model for now).

Here's what our models' attributes might look like:
  * `Order`: created_at
  * `Item`: name, description, price

Think about what the relationship between `orders` and `items` should be.

## Your Task

1. In the terminal, set up a new Rails app called `practice_associations`:

  ```
  $ rails new practice_associations -d postgresql
  $ cd practice_associations
  $ rake db:create
  ```

2. Reference the [Rails Docs](http://guides.rubyonrails.org/association_basics.html) on Associations. 


## Deliverable 

Create models and migrations for `orders` and `items`, and set up the proper relationship to associate data between the two tables. You can create these models in your `practice_associations` Rails app. 

###Generate a Model

Here is the general syntax for generating a model in rails:

```
rails g model MODEL_NAME [fields]
```

This will generate the model by itself along with the migration containing all the fields and the data types if you wrote them in the console.

###Rails Console

If the relationship is modeled correctly, you'll be able to test your models in the Rails console:

```
rails c
```

You should be able to do the following without throwing an error:

```ruby
# create new order
o = Order.create

# list order's items
o.items

# create new item
i = Item.create(name: "lamp", description: "desk lamp", price: 20)

# return item's order
i.order
```

**Once you've finished creating the models:**
  1. Create five items
  2. Create two orders
  3. Assign three items to the order with id = 1 and two items to the order with id = 2
  4. For one order, iterate through each of its items and print the item details to the console.
  4. Map each item in your database to its name.

## Stretch Challenge

Select only the items in an order that are less than a certain price.

**Hint:** Take a look at the ActiveRecord Docs for <a href="http://guides.rubyonrails.org/active_record_querying.html#conditions" target="_blank">`.where` conditions</a>. You'll need to write a SQL query in the `.where` method.

Start with something like this:

```ruby
some_order.items.where() # your code to check "price < ..." goes inside the ()
```


**Important: SQL Injection**

You'll notice the Ruby Guide lnked above has a warning about "SQL injection." With SQL injection attacks, users can trick your site into running SQL commands on your database. To protect against these attacks, Rails gives us a syntax for queries that uses `?`s instead of the regular string interpolation `#{}`. The `?` syntax plugs values into our SQL command strings, but it FIRST checks that the values don't contain SQL code. If you're done with this challenge set early, check out the hilarious (but scary) section on SQL injection in the ["Security" Rails Guide](http://guides.rubyonrails.org/security.html#sql-injection), and of course this well-known comic on the problem from XKCD:

![xkcd exploits of a mom](http://imgs.xkcd.com/comics/exploits_of_a_mom.png)


# Many-to-Many Challenges

Our goal is to build the relationship between `actors` and `movies`. An actor can appear in many movies, and a movie can have many actors. How would you set up this relationship? Is there an additional data table we need besides `actors` and `movies`? **Hint:** A *join* table has two different foreign keys, one for each model it is associating. 


Here's what our models' attributes might look like for actors and movies:
  * `Actor`: first_name, last_name
  * `Movie`: title, description, year

For these challenges, continue to work in your `practice` Rails app.

## Your Task

1. Create models and migrations for three tables: `actors`, `movies`, and a *join* table. Think about what you should name your join table and what columns it should have.
2. Implement a many-to-many relationship between `actors` and `movies`.
3. Use the Rails console to create at least three `actors` and two `movies`. Each movie should have at least one actor associated with it. 

## Stretch Challenges

1. Add <a href="http://guides.rubyonrails.org/active_record_validations.html" target="_blank">validations</a> to your `Actor` and `Movie` models:
  * All attributes for actors and movies should be required (**Hint:** `presence: true`)
  * For movies, the year should not be in the future (**Hint:** Look at <a href="http://guides.rubyonrails.org/active_record_validations.html#numericality" target="_blank">numericality</a>)

2. Test your validations in the Rails console:

  ```ruby
  a = Actor.create
  a.errors.messages
  # => What does this return?
  ```

## Stretch Challenge: Self-Referencing Assocations

Lots of real-world apps create assocations between items that are the same type of resource.  Read (or reread) <a href="http://guides.rubyonrails.org/association_basics.html#self-joins" target="_blank">the "self joins" section of the Associations Basics Rails Guide</a> and try to create a self-referencing association in your `practice_associations` app.  (Classic use cases are friends and following, where both related resources would be users.) No solution provided.




## Helpful Hints

When you're **creating associations** in Rails ActiveRecord (or most any ORM, for that matter):

  * Define the relationships in your models (the blueprint for your objects)
    * Don't forget to define all sides of the relationship (e.g. `has_many` and `belongs_to`)
  * Remember to put the foreign key for a relationship in your migration
    * If you're not sure which side of the relationship has the foreign key, just use this simple rule: the model with `belongs_to` must include a foreign key.

## Less Common Associations

These are for your references and are not used nearly as often as `has_many` and `has_many through`.

  * <a href="http://guides.rubyonrails.org/association_basics.html#the-has-one-association" target="_blank">has_one</a>
  * <a href="http://guides.rubyonrails.org/association_basics.html#the-has-one-through-association" target="_blank">has_one through</a>
  * <a href="http://guides.rubyonrails.org/association_basics.html#has-and-belongs-to-many-association-reference" target="_blank">has_and_belongs_to_many</a>

## Useful Docs

* <a href="http://guides.rubyonrails.org/association_basics.html" target="_blank">Associations Rails Guide</a>
* <a href="http://edgeguides.rubyonrails.org/active_record_migrations.html" target="_blank">Migrations Rails Guide</a>

