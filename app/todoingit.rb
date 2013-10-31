require_relative 'useraction'

get_index = ARGV[1].to_i - 1
get_after_command = ARGV[0].split(':')[1]

case ARGV[0]

  when /^add/i
    after_add_array = ARGV.slice(1..-1)
    UserAction.add(after_add_array)

  when /^complete/i
    UserAction.update('complete',get_index)

  when /^delete/i
    UserAction.update('delete',get_index)

  when /^filter/i
    puts get_after_command

  when /list.*/i
    UserAction.list(get_after_command)

  when /^tag/i
    tag_array = ARGV.slice(2..-1)
    UserAction.tag(get_index,tag_array)

end