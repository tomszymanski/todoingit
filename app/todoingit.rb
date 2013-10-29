require_relative 'useraction'

case ARGV[0]

  when /add/i
    ARGV.shift
    UserAction.add(ARGV)

  when /list.*/i
    list_ordering = ARGV[0].split(':')[1]
    UserAction.list(list_ordering)

  when /delete/i
    index_to_delete = Integer(ARGV[1]) - 1

    UserAction.update('delete',index_to_delete)

  when /complete/i
    index_to_complete = Integer(ARGV[1]) - 1

    UserAction.update('complete',index_to_complete)

end