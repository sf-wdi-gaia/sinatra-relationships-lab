# Sinatra From Scratch (with Relationships!)

This lesson provides a step-by-step tutorial walking through the process of building a simple single-resource Sinatra app from scratch.
As time permits, we can switch gears to create a second data model--we haven't see this yet!--and create a relationship between them with ActiveRecord.

#### Warmup:

- List ten pairs of models that could have a one-to-many relationship
- List ten pairs of models that could have a many-to-many relationship


#### Exercises:
Follow this link for a tutorial to make [Sinatra From Scratch](sinatra-from-scratch.md)
The `starter-code` here begins at the end of that tutorial.

Your challenge is to create a second model (`artists`) and create a one-to-many relationship between `artists` and `songs`.

solution-code provided for the end of this exercise.

#### Stretch:
If you are ready for a bigger challenge, start at the beginning of the sinatra-from-scratch tutorial and create a two-model app with a many-to-many relationship. The challenges here are based on actors and movies, but feel free to attempt something different.

__No solution code provided!__


## Helpful Hints

When you're **creating associations** in Sinatra ActiveRecord (or almost any ORM, for that matter):

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

