TODOINGIT
=================================
[![Code Climate](https://codeclimate.com/repos/525e192a7e00a40832001f0c/badges/64f54a7f030bd68a49b4/gpa.png)](https://codeclimate.com/repos/525e192a7e00a40832001f0c/feed)

Example commands
----------------

```
$ ruby todoingit.rb add Bake a delicious blueberry-glazed cheesecake
$ ruby todoingit.rb list
$ ruby todoingit.rb delete <task_id>
$ ruby todoingit.rb complete <task_id>
$ ruby todoingit.rb list:outstanding
$ ruby todoingit.rb list:completed
$ ruby todoingit.rb tag <task_id> <tag_name_1> <tag_name_2> ... <tag_name_N>

# To Be Impletemented
$ ruby todoingit.rb filter:<tag_name>
```

filter command
--------------

```
#This should display a list of all tasks with the personal tag sorted by creation date.
$ ruby todoingit.rb list
1. Eat some pie
2. Walk the dog

$ ruby todoingit.rb tag 2 personal pet-care
Tagging task "Walk the dog" with tags: personal, pet-care

$ ruby todoingit.rb filter:personal
2. Walk the dog [personal]
```


