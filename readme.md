# Sinatra From Scratch (with Relationships!)

This lesson provides a step-by-step tutorial walking through the process of building a simple single-resource Sinatra app from scratch.
As time permits, we can switch gears to create a second data model--we haven't see this yet!--and create a relationship between them with ActiveRecord.

#### Warmup:

- List ten pairs of models that could have a one-to-many relationship
- List ten pairs of models that could have a many-to-many relationship


#### Exercises:
Follow this link for a tutorial to make [Sinatra From Scratch](sinatra-from-scratch.md)
The `starter-code` here begins at the end of that tutorial.

Your challenge is to create a second model (`covers`) and create a one-to-many relationship between `covers` and `songs`.


SONGS | COVERS
-----|-----
ID | ID
Title | Title
Artist | Artist
Genre | Genre
Release Date | Re-release Date
    | SONG ID


## Question:

What might a join table look like?


## Deliverable 

Create models and migrations for `covers` and set up the proper relationship to associate data between them and their original `songs `. You can create these models in your `songs-app` Sinatra app. 

###Generate a Model

Create a migration for your new model:

```
rake db:create_migration NAME=create_covers

```

```ruby
class CreateCovers < ActiveRecord::Migration
  def change
    create_table :covers do |t|
      t.string :title 
      t.string :artist 
      t.string :genre
      t.string :release_date
      t.timestamps
    end
  end
end

```

```
rake db:migrate

```

This will create the model and update the schema.

Next you need to write write `has_many` or `belongs_to` associations for each model and perform another migration to associate the models properly.

  * Define the relationships in your models (the blueprint for your objects)
    * Don't forget to define all sides of the relationship (e.g. `has_many` and `belongs_to`)
  * Remember to put the foreign key for a relationship in your migration
    * If you're not sure which side of the relationship has the foreign key, just use this simple rule: the model with `belongs_to` must include a foreign key.


### Test in Tux Console

If the relationship is modeled correctly, you should be able to run the following test in `tux` without throwing an error:

```ruby
# create new song
s = Song.create({title: "I Will Survive", artist: "Gloria Gaynor", genre: "Disco", release_date: "1978"})

# create new cover
c = Cover.create({title: "I Will Survive", artist: "Cake", genre: "Alternative Rock", release_date: "1996", song_id: 5})

# NOTE: make sure the song_id is the same as the one in your db

# list song's covers
s.covers

# return cover's song
c.song

```

**Once you've finished creating the models:**
1. Create five covers
2. Create two songs
3. Assign three covers to the song with id = 4 and two covers to the song with id = 5
4. For one song, iterate through each of its covers and print the item details to the console.
5. Map each item in your database to its name.
6. Render the covers relative to their original songs in an erb file.
7. Select only the covers of a song that are after a specific release_date.

**Hint:** Take a look at the ActiveRecord Docs for <a href="http://guides.rubyonrails.org/active_record_querying.html#conditions" target="_blank">`.where` conditions</a>. You'll need to write a SQL query in the `.where` method.

Start with something like this:

```ruby
some_song.cover.where() # your code to check "release_date < ..." goes inside the ()
```

#### Stretch:
If you are ready for a bigger challenge, create a two-model app with a many-to-many relationship. If you stick with the songs-app idea, you may choose to put songs and artists in separate tables.



## Useful Docs

* <a href="http://guides.rubyonrails.org/association_basics.html" target="_blank">Associations Rails Guide</a>
* <a href="http://edgeguides.rubyonrails.org/active_record_migrations.html" target="_blank">Migrations Rails Guide</a>

## Less Common Associations

These are for your references and are not used nearly as often as `has_many` and `has_many through`.

  * <a href="http://guides.rubyonrails.org/association_basics.html#the-has-one-association" target="_blank">has_one</a>
  * <a href="http://guides.rubyonrails.org/association_basics.html#the-has-one-through-association" target="_blank">has_one through</a>
  * <a href="http://guides.rubyonrails.org/association_basics.html#has-and-belongs-to-many-association-reference" target="_blank">has_and_belongs_to_many</a>
