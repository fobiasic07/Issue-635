#!/bin/bash

# THIS FUNCTION NEEDS THREE PARAMETERS
# arg1 = input              Example:  hello ugly world
# arg2 = search regex       Example:  bad|ugly
# arg3 = replace            Example:  nice
function regex_replace()
{
  # $1 = hello ugly world
  # $2 = bad|ugly
  # $3 = nice

  # REGEX
  re="(.*?)($2)(.*)"

  if [[ $1 =~ $re ]]; then
    # if there is a match
    
    # ${BASH_REMATCH[0]} = hello ugly world
    # ${BASH_REMATCH[1]} = hello 
    # ${BASH_REMATCH[2]} = ugly
    # ${BASH_REMATCH[3]} = world    

    # hello + nice + world
    echo ${BASH_REMATCH[1]}$3${BASH_REMATCH[3]}
  else    
    # if no match return original input  hello ugly world
    echo "$1"
  fi    
}

# prints 'hello nice world'
regex_replace 'die(_("Cannot handle Files this big"))' 'die\(_\("([A-Z][a-z]*)(.*?)([A-Z])(.?*)' 'die(_("'