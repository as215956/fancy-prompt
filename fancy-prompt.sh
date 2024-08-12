$BACKGROUND_2+$COLOR))
    TSBG2=$(($BACKGROUND_3+$BG))
    
    TSFC3=$(($BACKGROUND_3+$COLOR))
    TSBG3=$(($DEFAULT+$BG))
    
    ## CALL FORMATING HELPER FUNCTION: effect + font color + BG color
    local SEPARATOR_FORMAT_1
    local SEPARATOR_FORMAT_2
    local SEPARATOR_FORMAT_3
    format_font SEPARATOR_FORMAT_1 $TSFC1 $TSBG1
    format_font SEPARATOR_FORMAT_2 $TSFC2 $TSBG2
    format_font SEPARATOR_FORMAT_3 $TSFC3 $TSBG3
    
    # GENERATE SEPARATORS WITH FANCY TRIANGLE
    local TRIANGLE=$'\uE0B0'
    local ROUNDED=$'\u25D7'
    local SEPARATOR_1=$SEPARATOR_FORMAT_1$TRIANGLE
    #local SEPARATOR_1=$SEPARATOR_FORMAT_1$ROUNDED
    local SEPARATOR_2=$SEPARATOR_FORMAT_2$TRIANGLE
    #local SEPARATOR_2=$SEPARATOR_FORMAT_2$ROUNDED
    local SEPARATOR_3=$SEPARATOR_FORMAT_3$TRIANGLE
    #local SEPARATOR_3=$SEPARATOR_FORMAT_3$ROUNDED
    
    
    ############################################################################
    ## WINDOW TITLE                                                           ##
    ## Prevent messed up terminal-window titles                               ##
    ############################################################################
    case $TERM in
        xterm*|rxvt*)
            local TITLEBAR='\[\033]0;\u@$(hostname -f):${NEW_PWD}\007\]'
        ;;
        *)
            local TITLEBAR=""
        ;;
    esac
    
    
    ############################################################################
    ## BASH PROMT                                                             ##
    ## Generate promt and remove format from the rest                         ##
    ############################################################################
    PS1="$TITLEBAR\n${PROMT_USER}${SEPARATOR_1}${PROMT_HOST}${SEPARATOR_2}${PROMT_PWD}${SEPARATOR_3}${PROMT_INPUT}"
    
    ## For terminal line coloring, leaving the rest standard
    none="$(tput sgr0)"
    trap 'echo -ne "${none}"' DEBUG
}



################################################################################
##  MAIN                                                                      ##
################################################################################

## Bash provides an environment variable called PROMPT_COMMAND.
## The contents of this variable are executed as a regular Bash command
## just before Bash displays a prompt.
## We want it to call our own command to truncate PWD and store it in NEW_PWD
PROMPT_COMMAND=bash_prompt_command

## Call bash_promnt only once, then unset it (not needed any more)
## It will set $PS1 with colors and relative to $NEW_PWD,
## which gets updated by $PROMT_COMMAND on behalf of the terminal
bash_prompt
unset bash_prompt
