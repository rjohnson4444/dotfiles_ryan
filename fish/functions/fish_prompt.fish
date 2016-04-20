function fish_prompt
  set -l last_status $status

  # the time
  set_color --background blue
  echo -n (date +" %I:%M %p ")
  set_color --background normal
  echo -n ' '

  # the path
  set_color --background blue
  echo -n " "(pwd | sed s:$HOME:~:)" "
  set_color --background normal
  echo -n ' '

  # the git shell
  if git branch ^&- >&-
    set_color green --background blue
    echo -n (git branch --no-color ^ /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1 /')
    set_color --background normal
  end

  # the prompt depends on the last status
  if [ $last_status = 0 ]
    echo -n \n"🐠 "
  else
    echo -n \n"🍣 " # sushi
    # other option: 🎣
  end
  set_color --background normal
  echo -n ' '

end
