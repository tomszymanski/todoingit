Single-user command-line TODO App
=================================

Example commands
----------------
  $ ruby todo.rb add Bake a delicious blueberry-glazed cheesecake
  $ ruby todo.rb list
  $ ruby todo.rb delete <task_id>
  $ ruby todo.rb complete <task_id>

Example CSV
-----------
  Bake a delicious blueberry-glazed cheesecake  
  Go play miniature golf with Mike Tyson  
  Become a World-Class Developer  

Learning Goals
--------------

* This application has all the moving parts of an MVC app : user input, display code, and data persistence. It is important to think about what responsibilities this application has to fulfill.
* Keep things like the single responsibility principle and separation of concerns in mind as you decide what objects and classes belong in your application.

Objectives
----------

* Enumerate the responsibilities of your TODO application. 
** These aren't just the user-facing commands like "add", "delete", etc. 
** They're also back-end responsibilities like reading and writing from the todo.csv file, parsing command-line arguments, and printing the "interface" to the console.
** Each responsibility should map to a concrete unit of Ruby code. 

Initialize an empty TODO list             | list = List.new
Add a task to a TODO list                 | list.add(Task.new("walk the dog"))
Get all the tasks on a TODO list          | tasks = list.tasks
Delete a particular task from a TODO list | ???
Complete a particular task on a TODO list | ???
Parse the command-line arguments and act  | ???
Turn todo.csv in Ruby Objects             | ???
AND MORE!!!!                              | ???


* Implement the list command:

  $ ruby todo.rb list
  1. Bake a delicious blueberry-glazed cheesecake
  2. Write up that memo and fax it out
  3. Conquer the world

You'll have to design and build basic controller and model code to make this work. For example, how does your program know the user wants to "add" a task to their list?

* Implement the add command

  $ ruby todo.rb add Walk the dog
  Appended "Walk the dog" to your TODO list...

* Implement the delete command

  $ ruby todo.rb list
  1. Bake a delicious blueberry-glazed cheesecake
  2. Write up that memo and fax it out
  3. Conquer the world

  $ ruby todo.rb delete 3
  Deleted "Conquer the world" from your TODO list...

  $ ruby todo.rb list
  1. Bake a delicious blueberry-glazed cheesecake
  2. Write up that memo and fax it out

* Implement completeness

Requirements:
* A user can complete a specific task from their TODO list
* A completed TODO task will be identified as such when a user uses the list command
Note: This will require changing the format of todo.csv and the code that parses it.

*Extra Credit: Human Readable File

Make it look good and handle commas

  1. [ ]  Bake a delicious blueberry-glazed cheesecake
  2. [X]  Write up that memo and fax it out
  3. [ ]  Conquer the world

(the brackets indicate whether the task has been completed or not)

What factors do you need to take into account to save this data correctly? 
How does this change the parsing (besides not being able to use the CSV class)?
Update your app to accommodate this new feature!

