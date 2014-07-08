cakephp2.x-habtm-example
==========

**cakephp2.x-habtm-example** is an example on how to save and validate a HABTM relationship between two models using CakePHP 2.x (The version used in this code is actually 2.2) 

We are using two models: Post and Tags. 

One post is related to N tags and one tag is related to N posts. This example was based on the generated code using cake bake.

The validation is made on server side only and it's done by using the validation methods provided by cake.


### Installation ###

- This is a classic cakephp project, so all you need to do is to copy/clone/pull the folder to your webroot folder
- There is a "database" folder on the root of the project. There you'll find a sql file and a workbench file. I'm using mysql for this example 

### Blog post ###

http://cakephp2.blogspot.com.au/2013/01/habtm.html