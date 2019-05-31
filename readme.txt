- design tables:

   1. products (id, name)
   2. attributes (id, name)
   3. attribute_values (id, attribute_id, value_type, value)
   4. product_attributes (id, product_id, attribute_id, attribute_value_id)  

   don't have any real tables created in this example code, just have model

- code structure
     + lib/  (model)
     + spec/ (automation test)  
     + Gemfile  (dependencies)

- require to run
   1. setup ruby (version > 2.0)
 
   2. run command below to install gem
      bundle install

   3. run rspec:
      bundle exec rspec
