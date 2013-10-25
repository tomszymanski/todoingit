require_relative 'useraction'

case ARGV[0]

  when /add/i
    UserAction.add

  when /list/i
    UserAction.list

  when /delete/i
    UserAction.update('delete',Integer(ARGV[1])-1)

  when /complete/i
    UserAction.update('complete',Integer(ARGV[1])-1)

end