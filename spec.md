# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
        -Each Scout has_many trips and has_many badges
- [X] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
        -Both Trips and Badges belongs_to a Scout
- [X] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
        -A Scout has many Badges through Scout_Badges
        -A Badge has many Scouts through Scout_Badges
- [X] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
        -See Above
- [X] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
        -The date of earning attribute is submitted with each new Scout_Badge
- [X] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
        -All models have some level of validation except Badge; however, no user is expected to edit this model. 
- [X] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
        -Model.order is used a few times in the code to put the camping trips and merit badge data in chronological order.
- [X] Include signup
- [X] Include login
- [X] Include logout
- [X] Include third party signup/login (how e.g. Devise/OmniAuth)
- [X] Include nested resource show or index (URL e.g. users/2/recipes)
        -trips.index and scout_badges.index views are nested resources.
- [X] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
        -trips.new view is nested.
- [X] Include form display of validation errors (form URL e.g. /recipes/new)
        -All forms have validation (except badges).  The login page would not show errors in view.

Confirm:
- [X] The application is pretty DRY
- [X] Limited logic in controllers
- [X] Views use helper methods if appropriate
- [X] Views use partials if appropriate