TODOINGIT
=================================
[![Code Climate](https://codeclimate.com/repos/525e192a7e00a40832001f0c/badges/64f54a7f030bd68a49b4/gpa.png)](https://codeclimate.com/repos/525e192a7e00a40832001f0c/feed)

Example commands
----------------

```
$ ruby todo.rb add Bake a delicious blueberry-glazed cheesecake
$ ruby todo.rb list
$ ruby todo.rb delete <task_id>
$ ruby todo.rb complete <task_id>

# To Be Impletemented
$ ruby todo.rb list:outstanding
$ ruby todo.rb list:completed
$ ruby todo.rb tag <task_id> <tag_name_1> <tag_name_2> ... <tag_name_N>
$ ruby todo.rb filter:<tag_name>
```

list:outstanding
----------------
Display a list of outstanding tasks sorted by creation date desc

list:completed
--------------
Display a list of completed tasks sorted by completion date asc

tag command
-----------

```
#Example Implementation
$ ruby todo.rb list
1. Eat some pie
2. Walk the dog

$ ruby todo.rb tag 2 personal pet-care
Tagging task "Walk the dog" with tags: personal, pet-care
```

filter command
--------------

```
#This should display a list of all tasks with the personal tag sorted by creation date.
$ ruby todo.rb list
1. Eat some pie
2. Walk the dog

$ ruby todo.rb tag 2 personal pet-care
Tagging task "Walk the dog" with tags: personal, pet-care

$ ruby todo.rb filter:personal
2. Walk the dog [personal]
```


