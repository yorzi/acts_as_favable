Acts As Favable
=================

Allows for favorite refer to be added to multiple and different models.

## Resources

####Install(on Rails3)

 To install as a plugin
 
    rails plugin install http://github.com/yorzi/acts_as_favable.git
   
 To install as a gem

    sudo gem install acts_as_favable

 Generate your favorite model:
 
    rails generate favorite
 
 Then migrate your database:
 
    rake db:migrate

## Usage
#### Make your ActiveRecord model act as favable.

    class Model < ActiveRecord::Base
 	   acts_as_favable
    end
 
####mark a favorite flag to a model instance
 
    favable = Model.create
    favable.favorites.create(:note => "I like this and will make it one of my favorites")

####Fetch favorites for a favable model:

    favable = Model.find(1)
    favorites = favable.favorites.recent.limit(10).all

Attention: This plugin/gem is heavily influenced by Acts As Taggable and almost copied from acts_at_commentable.

## More

Blog post..
