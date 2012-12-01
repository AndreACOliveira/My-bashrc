# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


if [ "$PS1" ]; then	# if running interactively, then run till 'fi' at EOF:

# source ~/.bashlocalrc	# settings that vary per workstation
OS=$(uname)		# for resolving pesky os differing switches



##################################################
# Color chart					 #
##################################################

txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
badgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset



##################################################
# This bashrc's current prompt		 	 #
##################################################

#PS1='\[\033]0;\w\007\]\[\e[35;1m\]\u\[\e[0m\]\[\e[32m\]@\h\[\e[34m\]\w \[\e[33m\]\$ \[\e[0m\]'	# purple, green, blue prompt w/default black & dir title

PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\]"	- purple, green, blue, cyan, yellow, with default black output (3-tier)



##################################################
# More PROMPT_COMMANDS				 #
##################################################

###### "Annoying" PROMPT_COMMAND animation
 PROMPT_COMMAND='seq $COLUMNS | xargs -IX printf "%Xs\r" @'



###### Saves terminal commands in history file in real time (for use with 'shopt -s histappend')
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"	# use with 'shopt -s histappend';save terminal commands in history file in real time

###### Shows date
 PROMPT_COMMAND='date +%k:%m:%S'

###### Shows memory, load average, and history
 PROMPT_COMMAND='history -a;echo -en "\033[m\033[38;5;2m"$(( `sed -nu "s/MemFree:[\t ]\+\([0-9]\+\) kB/\1/p" /proc/meminfo`/1024))"\033[38;5;22m/"$((`sed -nu "s/MemTotal:[\t ]\+\([0-9]\+\) kB/\1/Ip" /proc/meminfo`/1024 ))MB"\t\033[m\033[38;5;55m$(< /proc/loadavg)\033[m"'



###### Shows the return value of the last executed command (using smileys as to whether it was successful or not)
 PROMPT_COMMAND='RET=$?; if [[ $RET -eq 0 ]]; then echo -ne "\033[0;32m$RET\033[0m ;)"; else echo -ne "\033[0;31m$RET\033[0m ;("; fi; echo -n " "'


######################################################################################################################################################
###### BASH SETTINGS ###### BASH SETTINGS ###### BASH SETTINGS ###### BASH SETTINGS ###### BASH SETTINGS ###### BASH SETTINGS ###### BASH SETTINGS ######
######################################################################################################################################################



autoload -U compinit				# use to enable famous zsh tab-completion system
export BLOCKSIZE=K				# set blocksize size
export BROWSER='firefox'			# set default browser
export CDDIR="$HOME"				# for use with the function 'cd' and the alias 'cdd'
export EDITOR='vim'				# use default text editorexport HISTCONTROL=ignoreboth:erasedups		# for 'ignoreboth': ignore duplicates and /^\s/
export HISTCONTROL=ignoredups			# don't put duplicate lines in the history. See bash(1) for more options
export HISTFILE='$HOME/.history'		# set history file location
export HISTTIMEFORMAT='%Y-%m-%d_%H:%M:%S_%a  '	# makes history display in YYYY-MM-DD_HH:MM:SS_3CharWeekdaySpaceSpace format
export HOSTFILE=$HOME/.hosts    		# put list of remote hosts in ~/.hosts ...
# export http_proxy=${MY_PROXY}			# proxy setting
# export https_proxy=${MY_PROXY}		# proxy setting
export LC_COLLATE="en_CA.utf8"		# change sorting methods [a-Z] instead of [A-Z]
export LESSCHARSET='latin1'
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \'
# export MY_PROXY='http://YOUR_USERNAME:YOUR_PASSWORD@PROXY_IP:PROXY_PORT/'
# export OOO_FORCE_DESKTOP=gnome   		# openoffice preferences
export PAGER='less -e'
# export PATH=$PATH:$HOME/scripts
export PILOTRATE=57600			# make pilot-xfer go faster than 9600
export TERM='xterm'
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
#export TMOUT=600				# auto logout after n seconds of inactivity
export USER_CLIENT=deluge
export USER_DPRT=22218
export USER_OPRT=47426
export USER_VPRT=79
export USER_WPRT=30818
#export VIDEO_FORMAT=NTSC			# for use with creating compatible DVDs ('dvdauthor -x dvdauthor.xml' will fail if this not here)
# export VIDEO_FORMAT=PAL			# for use with creating compatible DVDs ('dvdauthor -x dvdauthor.xml' will fail if this not here)
export VISUAL='vim'
# mesg n              				#
set -b						# causes output from background processes to be output right away, not on wait for next primary prompt
set -o notify					# notify when jobs running in background terminate
# setopt nohup               			# don't kill bg jobs when tty quits
# setopt printexitvalue       			# print exit value from jobs
setterm -blength 0				# set the bell duration in milliseconds (silence the beeps)
set visible-stats on 				# when listing possible file completions, put / after directory names and * after programs
shopt -s cdable_vars				# set the bash option so that no '$' is required (disallow write access to terminal)
shopt -s cdspell				# this will correct minor spelling errors in a cd command
shopt -s checkhash
shopt -s checkwinsize				# update windows size on command
shopt -s cmdhist          			# save multi-line commands in history as single line
shopt -s dotglob				# files beginning with . to be returned in the results of path-name expansion
shopt -s expand aliases			# expand aliases
shopt -s extglob				# necessary for bash completion (programmable completion)
shopt -s histappend histreedit histverify
shopt -s mailwarn				# keep an eye on the mail file (access time)
shopt -s nocaseglob       			# pathname expansion will be treated as case-insensitive (auto-corrects the case)
shopt -s no_empty_cmd_completion		# no empty completion (bash>=2.04 only)
shopt -s sourcepath
stty start undef
stty stop undef
ulimit -S -c 0          			# (core file size) don't want any coredumps
unset HISTFILESIZE				# infinite History
unset HISTSIZE				# infinite History
unset MAILCHECK        				# don't want my shell to warn me of incoming mail
# unsetopt bgnice            			# don't nice bg command

if [ -d $HOME/Maildir/ ]; then
    export MAIL=$HOME/Maildir/
    export MAILPATH=$HOME/Maildir/
    export MAILDIR=$HOME/Maildir/
elif [ -f /var/mail/$USER ]; then
    export MAIL="/var/mail/$USER"
fi

if [ "$TERM" = "screen" ]; then
    export TERM=$TERMINAL
fi

function get_xserver()
{
    case $TERM in
       xterm )
            XSERVER=$(who am i | awk '{print $NF}' | tr -d ')''(' )
            # Ane-Pieter Wieringa suggests the following alternative:
            # I_AM=$(who am i)
            # SERVER=${I_AM#*(}
            # SERVER=${SERVER%*)}
            XSERVER=${XSERVER%%:*}
            ;;
        aterm | rxvt)
        # Find some code that works here. ...
            ;;
    esac
}
if [ -z ${DISPLAY:=""} ]; then
    get_xserver
    if [[ -z ${XSERVER}  || ${XSERVER} == $(hostname) || \
      ${XSERVER} == "unix" ]]; then
        DISPLAY=":0.0"          # Display on local host.
    else
        DISPLAY=${XSERVER}:0.0  # Display on remote host.
    fi
fi
export DISPLAY



##################################################
# PATH						 #
##################################################

if [ "$UID" -eq 0 ]; then
    PATH=$PATH:/usr/local:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/home/scripts
fi

# remove duplicate path entries
export PATH=$(echo $PATH | awk -F: '
{ for (i = 1; i <= NF; i++) arr[$i]; }
END { for (i in arr) printf "%s:" , i; printf "\n"; } ')

# autocomplete ssh commands
complete -W "$(echo `cat ~/.bash_history | egrep '^ssh ' | sort | uniq | sed 's/^ssh //'`;)" ssh


##################################################
# Various options to make $HOME comfy		 #
##################################################

 if [ ! -d "${HOME}/bin" ]; then
     mkdir ${HOME}/bin
     chmod 700 ${HOME}/bin
     echo "${HOME}/bin was missing.  I created it for you."
 fi
  if [ ! -d "${HOME}/Documents" ]; then
     if ! [  -d "${HOME}/data" ]; then
         mkdir ${HOME}/data
         chmod 700 ${HOME}/data
         echo "${HOME}/data was missing.  I created it for you."
     fi
 fi
  if [ ! -d "${HOME}/tmp" ]; then
     mkdir ${HOME}/tmp
     chmod 700 ${HOME}/tmp
     echo "${HOME}/tmp was missing.  I created it for you."
 fi
  if [ ! -d "${HOME}/scripts" ]; then
     mkdir ${HOME}/scripts
     chmod 700 ${HOME}/scripts
     echo "${HOME}/sctipts was missing.  I created it for you."
 fi


##################################################
# Automatically clean up all temporary files in	 #
# $HOME directory				 #
##################################################

find "$HOME" -type f \( -name "*~" -or -name ".*~" -or -name "*.old" -or -name "*.bak" -or -name "*.OLD" -or -name "*.BAK" \)|xargs -I{} bash -c "rm -rf \"{}\""



##################################################
# Stop Flash from tracking everything you do.	 #
##################################################

###### Brute force way to block all LSO cookies on Linux system with non-free Flash browser plugin
for A in ~/.adobe ~/.macromedia ; do ( [ -d $A ] && rm -rf $A ; ln -s -f /dev/null $A ) ; done



##################################################
# Bashrc greetings				 #
##################################################

###### greeting
 # get current hour (24 clock format i.e. 0-23)
hour=$(date +"%H")
 # if it is midnight to midafternoon will say G'morning
if [ $hour -ge 0 -a $hour -lt 12 ]
 then
   greet="Good Morning, $USER. Welcome back."
 # if it is midafternoon to evening ( before 6 pm) will say G'noon
 elif [ $hour -ge 12 -a $hour -lt 18 ]
 then
   greet="Good Afternoon, $USER. Welcome back."
 else # it is good evening till midnight
   greet="Good Evening, $USER. Welcome back."
 fi
 # display greeting
 echo $greet



###### holiday greeting
 # get current day (Month-Day Format)
 day=$(date +"%B%e")
 # get current year (for new years greeting)
 year=$(date +"%Y")
 # make sure the holiday greeting is displayed (if any)
 hol=1
 # if it is New Year's Day
 if [ "$day" = "January1" ]
 then
   holgreet="Happy New Years. Have a Happy $year."
 # if it is Valentine's Day
 elif [ "$day" = "February14" ]
 then
   holgreet="Have a Happy Valentine's Day."
 # if it is my birthday
 elif [ "$day" = "November9" ]
 then
   holgreet="Have a Happy Birthday."
 # if it is Halloween
 elif [ "$day" = "October31" ]
 then
   holgreet="Happy Halloween."
 # if it is Christmas Eve
 elif [ "$day" = "December24" ]
 then
   holgreet="Merry Christmas Eve."
 # if it is Christmas
 elif [ "$day" = "December25" ]
 then
   holgreet="Merry Christmas."
 # if it is New Year's Eve
 elif [ "$day" = "December31" ]
 then
   holgreet="Happy New Year's Eve."
 else
   hol=0
 fi
 # display holiday greeting
 if [ "$hol" = "1" ]
 then
 echo $holgreet
 elif [ "$hol" = "0" ]
 then
   randomvarthatsomehowimportant=0
 fi

######################################################################################################################################################
###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS ###### COMPLETIONS
######################################################################################################################################################



##################################################
# 'Universal' completion function		 #
##################################################

######  it works when commands have a so-called 'long options' mode
# ie: 'ls --all' instead of 'ls -a'
# Needs the '-o' option of grep
# (try the commented-out version if not available).
# First, remove '=' from completion word separators
# (this will allow completions like 'ls --color=auto' to work correctly).
COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}



##################################################
# To enable tab-completion with sudo		 #
##################################################

###### alternatively, install bash-completion, which does this too
complete -cf sudo



##################################################
# Completion functions (only since Bash-2.04)	 #
##################################################

###### avoid tilde expansion from the bash_completion script
function _expand()
{
    [ "$cur" != "${cur%\\}" ] && cur="$cur\\";
    if [[ "$cur" == \~*/* ]]; then
        #eval cur=$cur;
		:;
    else
        if [[ "$cur" == \~* ]]; then
            cur=${cur#\~};
            COMPREPLY=($( compgen -P '~' -u $cur ));
            return ${#COMPREPLY[@]};
        fi;
    fi
}



function _get_longopts()
{
    # $1 --help | sed  -e '/--/!d' -e 's/.*--\([^[:space:].,]*\).*/--\1/'| \
# grep ^"$2" |sort -u ;
    $1 --help | grep -o -e "--[^[:space:].,]*" | grep -e "$2" |sort -u
}



function _killall()
{
    local cur prev
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    # get a list of processes (the first sed evaluation
    # takes care of swapped out processes, the second
    # takes care of getting the basename of the process)
    COMPREPLY=( $( /usr/bin/ps -u $USER -o comm  | \
        sed -e '1,1d' -e 's#[]\[]##g' -e 's#^.*/##'| \
        awk '{if ($0 ~ /^'$cur'/) print $0}' ))
    return 0
}
complete -F _killall killall killps



function _longopts()
{
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}
    case "${cur:-*}" in
       -*)      ;;
        *)      return ;;
    esac
    case "$1" in
      \~*)      eval cmd="$1" ;;
        *)      cmd="$1" ;;
    esac
    COMPREPLY=( $(_get_longopts ${1} ${cur} ) )
}
complete  -o default -F _longopts configure bash
complete  -o default -F _longopts wget id info a2ps ls recode



function _make()
{
    local mdef makef makef_dir="." makef_inc gcmd cur prev i;
    COMPREPLY=();
    cur=${COMP_WORDS[COMP_CWORD]};
    prev=${COMP_WORDS[COMP_CWORD-1]};
    case "$prev" in
        -*f)
            COMPREPLY=($(compgen -f $cur ));
            return 0
        ;;
    esac;
    case "$cur" in
        -*)
            COMPREPLY=($(_get_longopts $1 $cur ));
            return 0
        ;;
    esac;
    # make reads `GNUmakefile', then `makefile', then `Makefile'
    if [ -f ${makef_dir}/GNUmakefile ]; then
        makef=${makef_dir}/GNUmakefile
    elif [ -f ${makef_dir}/makefile ]; then
        makef=${makef_dir}/makefile
    elif [ -f ${makef_dir}/Makefile ]; then
        makef=${makef_dir}/Makefile
    else
        makef=${makef_dir}/*.mk        # Local convention.
    fi
    # Before we scan for targets, see if a Makefile name was
    # specified with -f ...
    for (( i=0; i < ${#COMP_WORDS[@]}; i++ )); do
        if [[ ${COMP_WORDS[i]} == -f ]]; then
           # eval for tilde expansion
           eval makef=${COMP_WORDS[i+1]}
           break
        fi
    done
    [ ! -f $makef ] && return 0
    # deal with included Makefiles
    makef_inc=$( grep -E '^-?include' $makef | \
    sed -e "s,^.* ,"$makef_dir"/," )
    for file in $makef_inc; do
        [ -f $file ] && makef="$makef $file"
    done
    # If we have a partial word to complete, restrict completions to
    # matches of that word.
    if [ -n "$cur" ]; then gcmd='grep "^$cur"' ; else gcmd=cat ; fi
    COMPREPLY=( $( awk -F':' '/^[a-zA-Z0-9][^$#\/\t=]*:([^=]|$)/ \
                                {split($1,A,/ /);for(i in A)print A[i]}' \
                                $makef 2>/dev/null | eval $gcmd  ))
}
complete -F _make -X '+($*|*.[cho])' make gmake pmake\



###### A meta-command completion function for commands like sudo(8), which need to
# first complete on a command, then complete according to that command's own
# completion definition - currently not quite foolproof,
# but still quite useful (By Ian McDonald, modified by me).
function _meta_comp()
{
    local cur func cline cspec
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    cmdline=${COMP_WORDS[@]}
    if [ $COMP_CWORD = 1 ]; then
         COMPREPLY=( $( compgen -c $cur ) )
    else
        cmd=${COMP_WORDS[1]}            # Find command.
        cspec=$( complete -p ${cmd} )   # Find spec of that command.
        # COMP_CWORD and COMP_WORDS() are not read-only,
        # so we can set them before handing off to regular
        # completion routine:
        # Get current command line minus initial command,
        cline="${COMP_LINE#$1 }"
        # split current command line tokens into array,
        COMP_WORDS=( $cline )
        # set current token number to 1 less than now.
        COMP_CWORD=$(( $COMP_CWORD - 1 ))
        # If current arg is empty, add it to COMP_WORDS array
        # (otherwise that information will be lost).
        if [ -z $cur ]; then COMP_WORDS[COMP_CWORD]=""  ; fi
        if [ "${cspec%%-F *}" != "${cspec}" ]; then
      # if -F then get function:
            func=${cspec#*-F }
            func=${func%% *}
            eval $func $cline   # Evaluate it.
        else
            func=$( echo $cspec | sed -e 's/^complete//' -e 's/[^ ]*$//' )
            COMPREPLY=( $( eval compgen $func $cur ) )
        fi
    fi
}
complete -o default -F _meta_comp nohup \
eval exec trace truss strace sotruss gdb
complete -o default -F _meta_comp command type which man nice time



function _tar()
{
    local cur ext regex tar untar
    COMPREPLY=()
    cur=${COMP_WORDS[COMP_CWORD]}
    # If we want an option, return the possible long options.
    case "$cur" in
        -*)     COMPREPLY=( $(_get_longopts $1 $cur ) ); return 0;;
    esac
    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $( compgen -W 'c t x u r d A' -- $cur ) )
        return 0
    fi
    case "${COMP_WORDS[1]}" in
        ?(-)c*f)
            COMPREPLY=( $( compgen -f $cur ) )
            return 0
            ;;
            +([^Izjy])f)
            ext='tar'
            regex=$ext
            ;;
        *z*f)
            ext='tar.gz'
            regex='t\(ar\.\)\(gz\|Z\)'
            ;;
        *[Ijy]*f)
            ext='t?(ar.)bz?(2)'
            regex='t\(ar\.\)bz2\?'
            ;;
        *)
            COMPREPLY=( $( compgen -f $cur ) )
            return 0
            ;;
    esac
    if [[ "$COMP_LINE" == tar*.$ext' '* ]]; then
        # Complete on files in tar file.
        #
        # Get name of tar file from command line.
        tar=$( echo "$COMP_LINE" | \
               sed -e 's|^.* \([^ ]*'$regex'\) .*$|\1|' )
        # Devise how to untar and list it.
        untar=t${COMP_WORDS[1]//[^Izjyf]/}
        COMPREPLY=( $( compgen -W "$( echo $( tar $untar $tar \
                    2>/dev/null ) )" -- "$cur" ) )
        return 0

    else
        # File completion on relevant files.
        COMPREPLY=( $( compgen -G $cur\*.$ext ) )
    fi
    return 0
}
complete -F _tar -o default tar



##################################################
##################################################
##################################################








######################################################################################################################################################
###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS ###### FUNCTIONS
######################################################################################################################################################








##################################################
# Download all images from a 4chan thread	 #
##################################################

function 4chanimages()
{
curl -s http://boards.4chan.org/wg/|sed -r 's/.*href="([^"]*).*/\1\n/g'|grep images|xargs wget
}



##################################################
# Add a function you've defined to .bashrc	 #
##################################################

function addfunction() { declare -f $1 >> ~/.bashrc ; }



##################################################
# OpenPGP/GPG pubkeys stuff (for Launchpad / etc.#
##################################################

###### add keys
alias addkey='sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys'



###### autograb missing keys
alias autokey='sudo apt-get update 2> /tmp/keymissing; for key in $(grep "NO_PUBKEY" /tmp/keymissing |sed "s/.*NO_PUBKEY //"); do echo -e "\nProcessing key: $key"; gpg --keyserver pool.sks-keyservers.net --recv $key && gpg --export --armor $key | sudo apt-key add -; done'



###### create mykeys for use on Launchpad / etc.
alias createmykeys='gpg --gen-key'



###### show single repo key info using keyid found in 'sudo apt-key list'
alias exportkey='sudo apt-key export'



###### exports all repo keys info into single 'repokeys.txt' document
alias exportkeys='sudo apt-key exportall > repokeys.txt'



###### to export public OpenPGP keys to a file for safe keeping and potential restoration
alias exportmykeys='exportmykeys_private && exportmykeys_public'



###### to export private OpenPGP keys to a file for safe keeping and potential restoration
# using 'mykeys', put the appropriate GPG key after you type this function
function exportmykeys_private()
{
gpg --list-secret-keys
echo -n "Please enter the appropriate private key...
Look for the line that starts something like "sec 1024D/".
The part after the 1024D is the key_id.
...like this: '2942FE31'...

"
read MYKEYPRIV
gpg -ao Private_Keys-private.key --export-secret-keys "$MYKEYPRIV"
echo -n "All done."
}



###### to export public OpenPGP keys to a file for safe keeping and potential restoration
# using 'mykeys', put the appropriate GPG key after you type this function
function exportmykeys_public()
{
gpg --list-keys
echo -n "Please enter the appropriate public key...
Look for line that starts something like "pub 1024D/".
The part after the 1024D is the public key_id.
...like this: '2942FE31'...

"
read MYKEYPUB
gpg -ao Public_Keys-public.key --export "$MYKEYPUB"
echo -n "All done."
}



###### to get the new key fingerprint for use in the appropriate section on Launchpad.net to start verification process
alias fingerprintmykeys='gpg --fingerprint'



###### to automatically get all pubkeys (Launchpad PPA ones and others)
# requires: sudo apt-get install launchpad-getkeys
alias getkeys='sudo launchpad-getkeys'



###### to get a list of your public and private OpenPGP/GPG pubkeys
alias mykeys='gpg --list-keys && gpg --list-secret-keys'



###### publish newly-created mykeys for use on Launchpad / etc.
alias publishmykeys='gpg --keyserver hkp://keyserver.ubuntu.com --send-keys'



###### to restore your public and private OpenPGP keys
# from Public_Key-public.key and Private_Keys-private.key files:
function restoremykeys()
{
echo -n "Please enter the full path to Public keys (spaces are fine)...

Example: '/home/(your username)/Public_Key-public.key'...

"
read MYKEYS_PUBLIC_LOCATION
gpg --import "$MYKEYS_PUBLIC_LOCATION"
echo -n "Please enter the full path to Private keys (spaces are fine)...

Example: '/home/(your username)/Private_Keys-private.key'...

"
read MYKEYS_PRIVATE_LOCATION
gpg --import "$MYKEYS_PRIVATE_LOCATION"
echo -n "All done."
}



###### to setup new public and private OpenPGP keys
function setupmykeys()
{
# Generate new key
gpg --gen-key
# Publish new key to Ubuntu keyserver
gpg --keyserver hkp://keyserver.ubuntu.com --send-keys
# Import an OpenPGP key
gpg --fingerprint
# Verify new key
read -sn 1 -p "Before you continue, you must enter the fingerprint
in the appropriate place in your Launchpad PPA on their website...

Once you have successfully inputed it, wait for your email before
you press any key to continue...

"
gedit $HOME/file.txt
read -sn 1 -p "Once you have received your email from Launchpad to
verify your new key, copy and paste the email message received upon
import of OpenPGP key from "-----BEGIN PGP MESSAGE-----" till
"-----END PGP MESSAGE-----" to the 'file.txt' in your home folder
that was just opened for you

Once you have successfully copied and pasted it, save it and
press any key to continue...

"
gpg -d $HOME/file.txt
echo -n "All done."
}



###### shows list of repository keys
alias showkeys='sudo apt-key list'



##################################################
# Text alignment				 #
##################################################

###### center text in console with simple pipe like
function align_center() { l="$(cat -)"; s=$(echo -e "$l"| wc -L); echo "$l" | while read l;do j=$(((s-${#l})/2));echo "$(while ((--j>0)); do printf " ";done;)$l";done;} #; ls --color=none / | center



###### right-align text in console using pipe like ( command | right )
function align_right() { l="$(cat -)"; [ -n "$1" ] && s=$1 || s=$(echo -e "$l"| wc -L); echo "$l" | while read l;do j=$(((s-${#l})));echo "$(while ((j-->0)); do printf " ";done;)$l";done;} #; ls --color=none / | right 150



##################################################
# Network information and IP address stuff	 #
##################################################

###### get all IPs via ifconfig
function allips()
{
ifconfig | awk '/inet / {sub(/addr:/, "", $2); print $2}'
}

###### clear iptables rules safely
function clearIptables()
{
iptables -P INPUT ACCEPT; iptables -P FORWARD ACCEPT; iptables -P OUTPUT ACCEPT; iptables -F; iptables -X; iptables -L
}



###### online check
function connected() { ping -c1 -w2 google.com > /dev/null 2>&1; }



function connected_() { rm -f /tmp/connect; http_proxy='http://a.b.c.d:8080' wget -q -O /tmp/connect http://www.google.com; if [[ -s /tmp/connect ]]; then return 0; else return 1; fi; }



###### check if a remote port is up using dnstools.com
# (i.e. from behind a firewall/proxy)
function cpo() { [[ $# -lt 2 ]] && echo 'need IP and port' && return 2; [[ `wget -q "http://dnstools.com/?count=3&checkp=on&portNum=$2&target=$1&submit=Go\!" -O - |grep -ic "Connected successfully to port $2"` -gt 0 ]] && echo OPEN || echo CLOSED; }



###### find an unused unprivileged TCP port
function findtcp()
{
(netstat  -atn | awk '{printf "%s\n%s\n", $4, $4}' | grep -oE '[0-9]*$'; seq 32768 61000) | sort -n | uniq -u | head -n 1
}



###### geoip lookup (need geoip database: sudo apt-get install geoip-bin)
function geoip() {
geoiplookup $1
}



###### geoip information
# requires 'html2text': sudo apt-get install html2text
function geoiplookup() { curl -A "Mozilla/5.0" -s "http://www.geody.com/geoip.php?ip=$1" | grep "^IP.*$1" | html2text; }



###### get IP address of a given interface
# Example: getip lo
# Example: getip eth0	# this is the default
function getip()		{ lynx -dump http://whatismyip.org/; }



###### display private IP
function ippriv()
{
    ifconfig eth0|grep "inet adr"|awk '{print $2}'|awk -F ':' '{print $2}'
}



###### ifconfig connection check
function ips()
{
    if [ "$OS" = "Linux" ]; then
        for i in $( /sbin/ifconfig | grep ^e | awk '{print $1}' | sed 's/://' ); do echo -n "$i: ";  /sbin/ifconfig $i | perl -nle'/dr:(\S+)/ && print $1'; done
    elif [ "$OS" = "Darwin" ]; then
        for i in $( /sbin/ifconfig | grep ^e | awk '{print $1}' | sed 's/://' ); do echo -n "$i: ";  /sbin/ifconfig $i | perl -nle'/inet (\S+)/ && print $1'; done
    fi
}



###### geolocate a given IP address
function ip2loc() { wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICountry\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g'; }



function ip2locall() {
# best if used through a proxy, as ip2loc's free usage only lets you search a maximum of 20 times per day
# currently set on using a proxy through tor; if don't want that, just comment out the two 'export..' and 'unset...' lines
export http_proxy='http://localhost:8118'
export https_proxy='http://localhost:8118'
echo ""
echo "Country:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICountry\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Region (State, Province, Etc.):"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIRegion\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "City:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICity\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Latitude:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblILatitude\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Longitude:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblILongitude\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "ZIP Code:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIZIPCode\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Time Zone:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblITimeZone\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Net Speed:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblINetSpeed\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "ISP:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIISP\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Domain:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIDomain\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "IDD Code:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIIDDCode\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Area Code:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIAreaCode\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Weather Station:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIWeatherStation\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "MCC:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIMCC\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "MNC:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIMNC\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Mobile Brand:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIMobileBrand\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
unset http_proxy
unset https_proxy
}



function ip2locate() {
# best if used through a proxy, as ip2loc's free usage only lets you search a maximum of 20 times per day
# currently set on using a proxy through tor; if don't want that, just comment out the two 'export..' and 'unset...' lines
export http_proxy='http://localhost:8118'
export https_proxy='http://localhost:8118'
echo ""
echo "Country:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICountry\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Region (State, Province, Etc.):"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblIRegion\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "City:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblICity\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Latitude:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblILatitude\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
echo "Longitude:"
wget -qO - www.ip2location.com/$1 | grep "<span id=\"dgLookup__ctl2_lblILongitude\">" | sed 's/<[^>]*>//g; s/^[\t]*//; s/&quot;/"/g; s/</</g; s/>/>/g; s/&amp;/\&/g';
echo ""
unset http_proxy
unset https_proxy
}



###### find the IP addresses that are currently online in your network
function localIps()
{
for i in {1..254}; do
	x=`ping -c1 -w1 192.168.1.$i | grep "%" | cut -d"," -f3 | cut -d"%" -f1 | tr '\n' ' ' | sed 's/ //g'`
	if [ "$x" == "0" ]; then
		echo "192.168.1.$i"
	fi
done
}



###### myip - finds your current IP if your connected to the internet
function myip()
{
lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | awk '{ print $4 }' | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g'
}



###### netinfo - shows network information for your system
function netinfo()
{
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
/sbin/ifconfig | awk /'Bcast/ {print $3}'
/sbin/ifconfig | awk /'inet addr/ {print $4}'
/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
echo "${myip}"
echo "---------------------------------------------------"
}



###### check whether or not a port on your box is open
function portcheck() { for i in $@;do curl -s "deluge-torrent.org/test-port.php?port=$i" | sed '/^$/d;s/<br><br>/ /g';done; }



###### scp sending
function scpsend()
{
scp -P PORTNUMBERHERE "$@" USERNAME@YOURWEBSITE.com:/var/www/html/pathtodirectoryonremoteserver/;
}



###### show ip
# copyright 2007 - 2010 Christopher Bratusek
function show_ip()
{
	case $1 in
		*help | "" )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_ip${ewhite} |${egreen} <interface> ${eiceblue}[show ip-address for <interface>]\
			\n${eorange}show_ip${ewhite} |${egreen} external${eiceblue} [show external ip address]\n"
			tput sgr0
		;;
		*external )
			wget -q -O - http://showip.spamt.net/
		;;
		* )
			LANG=C /sbin/ifconfig $1 | grep 'inet addr:' | cut -d: -f2 | gawk '{ print $1}'
		;;
	esac
}



###### display the ttl of a hostname in a human readable form
function ttl()
{
/usr/sbin/timetrans -count $(dig +noquestion +noadditional +noauthority $1 | grep "^$1" | awk '{print $2}')
}



###### show Url information
# Usage:	url-info "ur"
# This script is part of nixCraft shell script collection (NSSC)
# Visit http://bash.cyberciti.biz/ for more information.
# Modified by Silviu Silaghi (http://docs.opensourcesolutions.ro) to handle
# more ip adresses on the domains on which this is available (eg google.com or yahoo.com)
# Last updated on Sep/06/2010
function url-info()
{
doms=$@
if [ $# -eq 0 ]; then
echo -e "No domain given\nTry $0 domain.com domain2.org anyotherdomain.net"
fi
for i in $doms; do
_ip=$(host $i|grep 'has address'|awk {'print $4'})
if [ "$_ip" == "" ]; then
echo -e "\nERROR: $i DNS error or not a valid domain\n"
continue
fi
ip=`echo ${_ip[*]}|tr " " "|"`
echo -e "\nInformation for domain: $i [ $ip ]\nQuerying individual IPs"
 for j in ${_ip[*]}; do
echo -e "\n$j results:"
whois $j |egrep -w 'OrgName:|City:|Country:|OriginAS:|NetRange:'
done
done
}



###### cleanly list available wireless networks (using iwlist)
function wscan()
{
iwlist wlan0 scan | sed -ne 's#^[[:space:]]*\(Quality=\|Encryption key:\|ESSID:\)#\1#p' -e 's#^[[:space:]]*\(Mode:.*\)$#\1\n#p'
}



##################################################
# Show all strings (ASCII & Unicode) in a file	 #
##################################################

function allStrings() { cat "$1" | tr -d "\0" | strings ; }



##################################################
# Find all videos under current directory using	 #
# MIME a.k.a not using extension		 #
##################################################

function allVideos() { find ./ -type f -print0 | xargs -0 file -iNf - | grep ": video/" | cut -d: -f1 ; }



##################################################
# Miscellaneous Fun				 #
##################################################


###### random Cyanide and Happiness comics from explosm.net
function cyanide() { display "$(wget -q http://explosm.net/comics/random/ -O - | grep -Po 'http://www.explosm.net/db/files/Comics/*/[^"]+(png|jpg|jpeg)')"; }



###### pretend to be busy in office to enjoy a cup of coffee
function busy_in_office()
{
cat /dev/urandom | hexdump -C | grep --color=auto "ca fe"
}



###### a simple number guessing game
function number_guess()
{
biggest=1000                            # maximum number possible
guess=0                                 # guessed by player
guesses=0                               # number of guesses made
number=$(( $$ % $biggest ))             # random number, 1 .. $biggest
while [ $guess -ne $number ] ; do
  echo -n "Guess? " ; read guess
  if [ "$guess" -lt $number ] ; then
    echo "... bigger!"
  elif [ "$guess" -gt $number ] ; then
    echo "... smaller!"
  fi
  guesses=$(( $guesses + 1 ))
done
echo "Right!! Guessed $number in $guesses guesses."
}



##################################################
# Temporarily add to PATH			 #
##################################################

function apath()
{
    if [ $# -lt 1 ] || [ $# -gt 2 ]; then
        echo "Temporarily add to PATH"
        echo "usage: apath [dir]"
    else
        PATH=$1:$PATH
    fi
}



##################################################
# Function you want after you've overwritten some#
# important file using > instead of >> ^^	 #
##################################################

function append() {
        lastarg="${!#}"
        echo "${@:1:$(($#-1))}" >> "$lastarg"
}



##################################################
# Common commands piped through grep		 #
##################################################

function aptg()		# debian specific.
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "search debian package list"
        echo "usage: aptg [program/keyword]"
    else
        apt-cache search $1 | sort | less
    fi
}



###### grep by paragraph instead of by line
function grepp() { [ $# -eq 1 ] && perl -00ne "print if /$1/i" || perl -00ne "print if /$1/i" < "$2";}



function hgg()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "search bash history"
        echo "usage: mg [search pattern]"
    else
        history | grep -i $1 | grep -v hg
    fi
}



function lsofg()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "grep lsof"
        echo "usage: losfg [port/program/whatever]"
    else
        lsof | grep -i $1 | less
    fi
}



function psg()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "grep running processes"
        echo "usage: psg [process]"
    else
        ps aux | grep USER | grep -v grep
        ps aux | grep -i $1 | grep -v grep
    fi
}



##################################################
# Sudo stuff					 #
##################################################


##################################################
# Arch-wiki-docs simple search			 #
##################################################

function archwikisearch() {
	# old version
	# cd /usr/share/doc/arch-wiki/html/
	# grep -i "$1" index.html | sed 's/.*HREF=.\(.*\.html\).*/\1/g' | xargs opera -newpage
	cd /usr/share/doc/arch-wiki/html/
	for i in $(grep -li $1 *)
	do
		STRING=`grep -m1 -o 'wgTitle = "[[:print:]]\+"' $i`
		LEN=${#STRING}
		let LEN=LEN-12
		STRING=${STRING:11:LEN}
		LOCATION="/usr/share/doc/arch-wiki/html/$i"
		echo -e " \E[33m$STRING   \E[37m$LOCATION"
	done
}



##################################################
# Numerical conversions and numbers stuff	 #
##################################################

###### convert ascii
# copyright 2007 - 2010 Christopher Bratusek
function asc2all() {
	if [[ $1 ]]; then
		echo "ascii $1 = binary $(asc2bin $1)"
		echo "ascii $1 = octal $(asc2oct $1)"
		echo "ascii $1 = decimal $(asc2dec $1)"
		echo "ascii $1 = hexadecimal $(asc2hex $1)"
		echo "ascii $1 = base32 $(asc2b32 $1)"
		echo "ascii $1 = base64 $(asc2b64 $1)"
	fi
}



function asc2bin() {
	if [[ $1 ]]; then
		echo "obase=2 ; $(asc2dec $1)" | bc
	fi
}



function asc2b64() {
	if [[ $1 ]]; then
		echo "obase=64 ; $(asc2dec $1)" | bc
	fi
}



function asc2b32() {
	if [[ $1 ]]; then
		echo "obase=32 ; $(asc2dec $1)" | bc
	fi
}



function asc2dec() {
	if [[ $1 ]]; then
		printf '%d\n' "'$1'"
	fi
}



function asc2hex() {
	if [[ $1 ]]; then
		echo "obase=16 ; $(asc2dec $1)" | bc
	fi
}



function asc2oct() {
	if [[ $1 ]]; then
		echo "obase=8 ; $(asc2dec $1)" | bc
	fi
}



###### Averaging columns of numbers
# Computes a columns average in a file. Input parameters = column number and optional pattern.
function avg() { awk "/$2/{sum += \$$1; lc += 1;} END {printf \"Average over %d lines: %f\n\", lc, sum/lc}"; }



###### convert binaries
# copyright 2007 - 2010 Christopher Bratusek
function bin2all() {
	if [[ $1 ]]; then
		echo "binary $1 = octal $(bin2oct $1)"
		echo "binary $1 = decimal $(bin2dec $1)"
		echo "binary $1 = hexadecimal $(bin2hex $1)"
		echo "binary $1 = base32 $(bin2b32 $1)"
		echo "binary $1 = base64 $(bin2b64 $1)"
		echo "binary $1 = ascii $(bin2asc $1)"
	fi
}



function bin2asc() {
	if [[ $1 ]]; then
		echo -e "\0$(printf %o $((2#$1)))"
	fi
}



function bin2b64() {
	if [[ $1 ]]; then
		echo "obase=64 ; ibase=2 ; $1" | bc
	fi
}



function bin2b32() {
	if [[ $1 ]]; then
		echo "obase=32 ; ibase=2 ; $1 " | bc
	fi
}



function bin2dec() {
	if [[ $1 ]]; then
		echo $((2#$1))
	fi
}



function bin2hex() {
	if [[ $1 ]]; then
		echo "obase=16 ; ibase=2 ; $1" | bc
	fi
}



function bin2oct() {
	if [[ $1 ]]; then
		echo "obase=8 ; ibase=2 ; $1" | bc
	fi
}



###### simple calculator to 4 decimals
function calc() {
echo "scale=4; $1" | bc
}



###### temperature conversion
# Copyright 2007 - 2010 Christopher Bratusek
function cel2fah() {

  if [[ $1 ]]; then
	echo "scale=2; $1 * 1.8  + 32" | bc
  fi

}



function cel2kel() {

  if [[ $1 ]]; then
	echo "scale=2; $1 + 237.15" | bc
  fi

}



function fah2cel() {

  if [[ $1 ]]; then
	echo "scale=2 ; ( $1 - 32  ) / 1.8" | bc
  fi

}



function fah2kel() {

  if [[ $1 ]]; then
	echo "scale=2; ( $1 + 459.67 ) / 1.8 " | bc
  fi

}



function kel2cel() {

  if [[ $1 ]]; then
	echo "scale=2; $1 - 273.15" | bc
  fi

}



function kel2fah() {

  if [[ $1 ]]; then
	echo "scale=2; $1 * 1.8 - 459,67" | bc
  fi

}



###### Output an ASCII character given its decimal equivalent
function chr() { printf \\$(($1/64*100+$1%64/8*10+$1%8)); }



###### the notorious "hailstone" or Collatz series.
function collatz()
{
# get the integer "seed" from the command-line to generate the integer "result"
# if NUMBER is even, divide by 2, or if odd, multiply by 3 and add 1
# the theory is that every sequence eventually settles down to repeating "4,2,1..." cycles
MAX_ITERATIONS=200
# For large seed numbers (>32000), try increasing MAX_ITERATIONS.
h=${1:-$$}                      #  Seed. #  Use $PID as seed, #+ if not specified as command-line arg.
echo
echo "C($h) --- $MAX_ITERATIONS Iterations"
echo
for ((i=1; i<=MAX_ITERATIONS; i++))
do
COLWIDTH=%7d
printf $COLWIDTH $h
  let "remainder = h % 2"
  if [ "$remainder" -eq 0 ]   # Even?
  then
    let "h /= 2"              # Divide by 2.
  else
    let "h = h*3 + 1"         # Multiply by 3 and add 1.
  fi
COLUMNS=10                    # Output 10 values per line.
let "line_break = i % $COLUMNS"
if [ "$line_break" -eq 0 ]
then
  echo
fi
done
echo
}



###### temperature conversion script that lets the user enter
# a temperature in any of Fahrenheit, Celsius or Kelvin and receive the
# equivalent temperature in the other two units as the output.
# usage:	convertatemp F100 (if don't put F,C, or K, default is F)
function convertatemp()
{
if uname | grep 'SunOS'>/dev/null ; then
  echo "Yep, SunOS, let\'s fix this baby"
  PATH="/usr/xpg4/bin:$PATH"
fi
if [ $# -eq 0 ] ; then
  cat << EOF >&2
Usage: $0 temperature[F|C|K]
where the suffix:
   F	indicates input is in Fahrenheit (default)
   C	indicates input is in Celsius
   K	indicates input is in Kelvin
EOF
fi
unit="$(echo $1|sed -e 's/[-[[:digit:]]*//g' | tr '[:lower:]' '[:upper:]' )"
temp="$(echo $1|sed -e 's/[^-[[:digit:]]*//g')"
case ${unit:=F}
in
  F ) # Fahrenheit to Celsius formula:  Tc = (F -32 ) / 1.8
  farn="$temp"
  cels="$(echo "scale=2;($farn - 32) / 1.8" | bc)"
  kelv="$(echo "scale=2;$cels + 273.15" | bc)"
  ;;
  C ) # Celsius to Fahrenheit formula: Tf = (9/5)*Tc+32
  cels=$temp
  kelv="$(echo "scale=2;$cels + 273.15" | bc)"
  farn="$(echo "scale=2;((9/5) * $cels) + 32" | bc)"
  ;;
  K ) # Celsius = Kelvin + 273.15, then use Cels -> Fahr formula
  kelv=$temp
  cels="$(echo "scale=2; $kelv - 273.15" | bc)"
  farn="$(echo "scale=2; ((9/5) * $cels) + 32" | bc)"
esac
echo "Fahrenheit = $farn"
echo "Celsius    = $cels"
echo "Kelvin     = $kelv"
}



###### convert hexadecimal numbers to decimals
function dec()		{ printf "%d\n" $1; }



###### convert decimals to hexadecimal numbers
function hex()		{ printf "0x%08x\n" $1; }



###### convert decimals
# copyright 2007 - 2010 Christopher Bratusek
function dec2all() {
	if [[ $1 ]]; then
		echo "decimal $1 = binary $(dec2bin $1)"
		echo "decimal $1 = octal $(dec2oct $1)"
		echo "decimal $1 = hexadecimal $(dec2hex $1)"
		echo "decimal $1 = base32 $(dec2b32 $1)"
		echo "decimal $1 = base64 $(dec2b64 $1)"
		echo "deciaml $1 = ascii $(dec2asc $1)"
	fi
}



function dec2asc() {
	if [[ $1 ]]; then
		echo -e "\0$(printf %o 97)"
	fi
}



function dec2bin() {
	if [[ $1 ]]; then
		echo "obase=2 ; $1" | bc
	fi
}



function dec2b64() {
	if [[ $1 ]]; then
		echo "obase=64 ; $1" | bc
	fi
}



function dec2b32() {
	if [[ $1 ]]; then
		echo "obase=32 ; $1" | bc
	fi
}



function dec2hex() {
	if [[ $1 ]]; then
		echo "obase=16 ; $1" | bc
	fi
}



function dec2oct() {
	if [[ $1 ]]; then
		echo "obase=8 ; $1" | bc
	fi
}



# individual numbers
# Usage:	dec2text 1234 -> one two three four
function dec2text_()
{
# This script is part of nixCraft shell script collection (NSSC)
# Visit http://bash.cyberciti.biz/ for more information.
n=$1
len=$(echo $n | wc -c)
len=$(( $len - 1 ))
for (( i=1; i<=$len; i++ ))
do
   # get one digit at a time
    digit=$(echo $n | cut -c $i)
   # use case control structure to find digit equivalent in words
    case $digit in
        0) echo -n "zero " ;;
        1) echo -n "one " ;;
        2) echo -n "two " ;;
        3) echo -n "three " ;;
        4) echo -n "four " ;;
        5) echo -n "five " ;;
        6) echo -n "six " ;;
        7) echo -n "seven " ;;
        8) echo -n "eight " ;;
        9) echo -n "nine " ;;
    esac
done
# just print new line
echo ""
}



function d2u() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ -e "$1" ]]; then
		sed -r 's/\r$//' -i "$1"
	fi
}



function u2d() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ -e "$1" ]]; then
		sed -r 's/$/\r/' -i "$1"
	fi
}



###### factorial for integers
function factorial()
{
echo "Enter an integer: "
read n
# Below we define the factorial function in bc syntax
fact="define f (x) {
i=x
fact=1
while (i > 1) {
fact=fact*i
i=i-1
}
return fact
}"
# Below we pass the function defined above, and call it with n as a parameter and pipe it to bc
factorial=`echo "$fact;f($n)" | bc -l`
echo "$n! = $factorial"
}



###### convert hexadecimal numbers
# copyright 2007 - 2010 Christopher Bratusek
function hex2all() {
	if [[ $1 ]]; then
		echo "hexadecimal $1 = binary $(hex2bin $1)"
		echo "hexadecimal $1 = octal $(hex2oct $1)"
		echo "hexadecimal $1 = decimal $(hex2dec $1)"
		echo "hexadecimal $1 = base32 $(hex2b32 $1)"
		echo "hexadecimal $1 = base64 $(hex2b64 $1)"
		echo "hexadecimal $1 = ascii $(hex2asc $1)"
	fi
}



function hex2asc() {
	if [[ $1 ]]; then
		echo -e "\0$(printf %o $((16#$1)))"
	fi
}



function hex2bin() {
	if [[ $1 ]]; then
		echo "obase=2 ; ibase=16 ; $1" | bc
	fi
}



function hex2b64() {
	if [[ $1 ]]; then
		echo "obase=64 ; ibase=16 ; $1" | bc
	fi
}



function hex2b32() {
	if [[ $1 ]]; then
		echo "obase=32 ; ibase=16 ; $1" | bc
	fi
}



function hex2dec() {
	if [[ $1 ]]; then
		 echo $((16#$1))
	fi
}



function hex2oct() {
	if [[ $1 ]]; then
		echo "obase=8 ; ibase=16 ; $1" | bc
	fi
}



###### length
function length()
{
    if [ $# -lt 1 ]; then
        echo "count # of chars in arugment"
        echo "usage: length [string]"
    else
        echo -n $@ | wc -c
    fi
}



###### finding logs for numbers
function math-log()
{
echo "Enter value: "
read x
echo "Natural Log: ln($x) :"
echo "l($x)" | bc -l
echo "Ten Base Log: log($x) :"
echo "l($x)/l(10)" | bc -l
}



###### magic square generator (odd-order squares only!)
function msquare()
{
# Author: mendel cooper
EVEN=2
MAXSIZE=31   # 31 rows x 31 cols.
E_usage=90   # Invocation error.
dimension=
declare -i square
function usage_message()
{
  echo "Usage: $0 square-size"
  echo "   ... where \"square-size\" is an ODD integer"
  echo "       in the range 3 - 31."  #  Works for squares up to order 159
}
function calculate()       # Here's where the actual work gets done.
{
  local row col index dimadj j k cell_val=1
  dimension=$1
  let "dimadj = $dimension * 3"; let "dimadj /= 2"   # x 1.5, then truncate.
  for ((j=0; j < dimension; j++))
  do
    for ((k=0; k < dimension; k++))
    do  # Calculate indices, then convert to 1-dim. array index.
        # Bash doesn't support multidimensional arrays. Pity.
      let "col = $k - $j + $dimadj"; let "col %= $dimension"
      let "row = $j * 2 - $k + $dimension"; let "row %= $dimension"
      let "index = $row*($dimension) + $col"
      square[$index]=cell_val; ((cell_val++))
    done
  done
}     # Plain math, no visualization required.
function print_square()               # Output square, one row at a time.
{
  local row col idx d1
  let "d1 = $dimension - 1"   # Adjust for zero-indexed array.
  for row in $(seq 0 $d1)
  do
    for col in $(seq 0 $d1)
    do
      let "idx = $row * $dimension + $col"
      printf "%3d " "${square[idx]}"; echo -n "  "
    done   # Displays up to 13-order neatly in 80-column term window.
    echo   # Newline after each row.
  done
}
if [[ -z "$1" ]] || [[ "$1" -gt $MAXSIZE ]]
then
  usage_message
fi
let "test_even = $1 % $EVEN"
if [ $test_even -eq 0 ]
then           # Can't handle even-order squares.
  usage_message
fi
calculate $1
print_square   # echo "${square[@]}"   # DEBUG
}



###### print multiplication tables
function multitables()
{
for i in {1..9}; do for j in `seq 1 $i`; do echo -ne "${j}x${i}=$((j*i))\t"; done; echo; done
}



###### given a number, show it with comma separated values
function nicenumber()
{
# expects DD and TD to be instantiated. instantiates nicenum
# or, if a second arg is specified, the output is echoed to stdout
function nice_number()
{
  # Note that we use the '.' as the decimal separator for parsing
  # the INPUT value to this script. The output value is as specified
  # by the user with the -d flag, if different from a '.'
  integer=$(echo $1 | cut -d. -f1)		# left of the decimal
  decimal=$(echo $1 | cut -d. -f2)		# right of the decimal
  if [ $decimal != $1 ]; then
    # there's a fractional part, let's include it.
    result="${DD:="."}$decimal"
  fi
  thousands=$integer
  while [ $thousands -gt 999 ]; do
    remainder=$(($thousands % 1000))	# three least significant digits
    while [ ${#remainder} -lt 3 ] ; do	# force leading zeroes as needed
      remainder="0$remainder"
    done
    thousands=$(($thousands / 1000))	# to left of remainder, if any
    result="${TD:=","}${remainder}${result}"	# builds right-to-left
  done
  nicenum="${thousands}${result}"
  if [ ! -z $2 ] ; then
    echo $nicenum
  fi
}
DD="."	# decimal point delimiter, between integer & fractional value
TD=","	# thousands delimiter, separates every three digits
while getopts "d:t:" opt; do
  case $opt in
    d ) DD="$OPTARG"	;;
    t ) TD="$OPTARG"	;;
  esac
done
shift $(($OPTIND - 1))
if [ $# -eq 0 ] ; then
  cat << "EOF" >&2
Usage: $(basename $0) [-d c] [-t c] numeric value
       -d specifies the decimal point delimiter (default '.')
       -t specifies the thousands delimiter (default ',')
EOF
fi
nice_number $1 1	# second arg forces this to 'echo' output
}



###### convert normal to unix
function normal2unix()
{
    echo "${@}" | awk '{print mktime($0)}';
}



###### convert unix to normal
function unix2normal()
{
    echo $1 | awk '{print strftime("%Y-%m-%d %H:%M:%S",$1)}';
}



###### list of numbers with equal width
function nseq()
{
seq -w 0 "$1"
}



###### convert octals
# copyright 2007 - 2010 Christopher Bratusek
function oct2all() {
	if [[ $1 ]]; then
		echo "octal $1 = binary $(oct2bin $1)"
		echo "octal $1 = decimal $(oct2dec $1)"
		echo "octal $1 = hexadecimal $(oct2hex $1)"
		echo "octal $1 = base32 $(oct2b32 $1)"
		echo "octal $1 = base64 $(oct2b64 $1)"
		echo "octal $1 = ascii $(oct2asc $1)"
	fi
}



function oct2asc() {
	if [[ $1 ]]; then
		echo -e "\0$(printf %o $((8#$1)))"
	fi
}



function oct2bin() {
	if [[ $1 ]]; then
		echo "obase=2 ; ibase=8 ; $1" | bc
	fi
}



function oct2b64() {
	if [[ $1 ]]; then
		echo "obase=64 ; ibase=8 ; $1" | bc
	fi
}



function oct2b32() {
	if [[ $1 ]]; then
		echo "obase=32 ; ibase=8 ; $1" | bc
	fi
}



function oct2dec() {
	if [[ $1 ]]; then
		echo $((8#$1))
	fi
}



function oct2hex() {
	if [[ $1 ]]; then
		echo "obase=16 ; ibase=8 ; $1" | bc
	fi
}



###### Pascal's triangle
function pascal() { l=15;for((i=0;i<$l;i++));do eval "a$i=($(pv=1;v=1;for((j=0;j<$l-$i;j++));do [ $i -eq 0 -o $j -eq 0 ]&&{ v=1 && pv=1; }||v=$((pv+a$((i-1))[$((j))]));echo -n "$v ";pv=$v;done;));";o="$(eval echo "$(for((k=0;k<=$i;k++)); do eval "echo -n \"\$((a\$((i-k))[k])) \""; done)")";echo "$o";s="${#o}"; done; } | while read l; do j=$((s-${#l}/2)); echo "$(while ((i++ < j)); do echo -n " ";done;)$l";done




###### powers of numerals
# copyright 2007 - 2010 Christopher Bratusek
function power() {
	if [[ $1 ]]; then
		if [[ $2 ]]; then
			echo "$1 ^ $2" | bc
		else	echo "$1 ^ 2" | bc
		fi
	fi
}



###### generate prime numbers, without using arrays.
# script contributed by Stephane Chazelas.
function primes()
{
LIMIT=1000                    # Primes, 2 ... 1000.
Primes()
{
 (( n = $1 + 1 ))             # Bump to next integer.
 shift                        # Next parameter in list.
#  echo "_n=$n i=$i_"
 if (( n == LIMIT ))
 then echo $*
 return
 fi
 for i; do                    # "i" set to "@", previous values of $n.
#   echo "-n=$n i=$i-"
   (( i * i > n )) && break   # Optimization.
   (( n % i )) && continue    # Sift out non-primes using modulo operator.
   Primes $n $@               # Recursion inside loop.
   return
   done
   Primes $n $@ $n            #  Recursion outside loop.
                              #  Successively accumulate
			      #+ positional parameters.
                              #  "$@" is the accumulating list of primes.
}
Primes 1
}



###### radicals of numbers
# copyright 2007 - 2010 Christopher Bratusek
function radical() {
	if [[ $1 ]]; then
		echo "sqrt($1)" | bc -l
	fi
}

###### round numerals to whole numbers
# copyright 2007 - 2010 Christopher Bratusek
function round() {
	if [[ $1 ]]; then
		if [[ $2 ]]; then
			echo "$(printf %.${2}f $1)"
		else	echo "$(printf %.0f $1)"
		fi
	fi
}



###### ruler that stretches across the terminal
function ruler() { for s in '....^....|' '1234567890'; do w=${#s}; str=$( for (( i=1; $i<=$(( ($COLUMNS + $w) / $w )) ; i=$i+1 )); do echo -n $s; done ); str=$(echo $str | cut -c -$COLUMNS) ; echo $str; done; }



###### convert seconds to minutes, hours, days, and etc.
# inputs a number of seconds, outputs a string like "2 minutes, 1 second"
# $1: number of seconds
function sec2all()
{
    local millennia=$((0))
    local centuries=$((0))
    local years=$((0))
    local days=$((0))
    local hour=$((0))
    local mins=$((0))
    local secs=$1
    local text=""
    # convert seconds to days, hours, etc
    millennia=$((secs / 31536000000))
    secs=$((secs % 31536000000))
    centuries=$((secs / 3153600000))
    secs=$((secs % 3153600000))
    years=$((secs / 31536000))
    secs=$((secs % 31536000))
    days=$((secs / 86400))
    secs=$((secs % 86400))
    hour=$((secs / 3600))
    secs=$((secs % 3600))
    mins=$((secs / 60))
    secs=$((secs % 60))
    # build full string from unit strings
    text="$text$(seconds-convert-part $millennia "millennia")"
    text="$text$(seconds-convert-part $centuries "century")"
    text="$text$(seconds-convert-part $years "year")"
    text="$text$(seconds-convert-part $days "day")"
    text="$text$(seconds-convert-part $hour "hour")"
    text="$text$(seconds-convert-part $mins "minute")"
    text="$text$(seconds-convert-part $secs "second")"
    # trim leading and trailing whitespace
    text=${text## }
    text=${text%% }
    # special case for zero seconds
    if [ "$text" == "" ]; then
        text="0 seconds"
    fi
    # echo output for the caller
    echo ${text}
}
# formats a time unit into a string
# $1: integer count of units: 0, 6, etc
# $2: unit name: "hour", "minute", etc
function seconds-convert-part()
{
    local unit=$1
    local name=$2
    if [ $unit -ge 2 ]; then
        echo " ${unit} ${name}s"
    elif [ $unit -ge 1 ]; then
        echo " ${unit} ${name}"
    else
        echo ""
    fi
}



###### finding the square root of numbers
function sqrt()
{
echo "sqrt ("$1")" | bc -l
}



###### converts a string (words, text) to binary
function string2bin()
{
perl -nle 'printf "%0*v8b\n"," ",$_'
}



###### trigonmetry calculations with angles
function trig-angle()
{
echo "Enter angle in degree: "
read deg
# Note: Pi calculation
# tan(pi/4) = 1
# atan(1) = pi/4 and
# pi = 4*atan(1)
pi=`echo "4*a(1)" | bc -l`
rad=`echo "$deg*($pi/180)" | bc -l`
echo "$deg Degree = $rad Radian"
echo "Sin($deg): "
echo "s($rad)" | bc -l
echo "Cos($deg): "
echo "c($rad)" | bc -l
echo "Tan($deg): "
echo "s($rad)/c($rad)" | bc -l
}



##################################################
# Ask						 #
##################################################

function ask()
{
    echo -n "$@" '[y/n] ' ; read ans
    case "$ans" in
        y*|Y*) return 0 ;;
        *) return 1 ;;
    esac
}



##################################################
# Escape potential tarbombs			 #
##################################################

function atb() { l=$(tar tf $1); if [ $(echo "$l" | wc -l) -eq $(echo "$l" | grep $(echo "$l" | head -n1) | wc -l) ]; then tar xf $1; else mkdir ${1%.tar.gz} && tar xf $1 -C ${1%.tar.gz}; fi ; }



##################################################
# Get the headlines of an atom feed		 #
##################################################

function atomtitles()
{
curl --silent $1 | xmlstarlet sel -N atom="http://www.w3.org/2005/Atom" -t -m /atom:feed/atom:entry -v atom:title -n
}


##################################################
# Download AUR package using best guess at	 #
# filename					 #
##################################################

function aurget() {
  local DIR=$HOME/Packages
  cd $DIR && wget http://aur.archlinux.org/packages/${1}/${1}.tar.gz
  ls -l
}



##################################################
# ~/ functions					 #
##################################################

function backupsfolder()
{
    if [ -d $HOME/backups_html ]; then
        chown -R $USER:www-data $HOME/backups_html
        chmod 755 $HOME/backups_html
        find $HOME/backups_html/ -type d -exec chmod 775 {} \;
        find $HOME/backups_html/ -type f -exec chmod 664 {} \;
        chmod 755 $HOME
    fi
}



function private()
{
    find $HOME -type d -exec chmod 700 {} \;
    find $HOME -type f -exec chmod 600 {} \;
    find $HOME/bin -type f -exec chmod +x {} \;
    find $HOME/.dropbox-dist/dropbox* -type f -exec chmod +x {} \;
}



function publicfolder()
{
    if [ -d $HOME/public_html ]; then
        chown -R $USER:www-data $HOME/public_html
        chmod 755 $HOME/public_html
        find $HOME/public_html/ -type d -exec chmod 775 {} \;
        find $HOME/public_html/ -type f -exec chmod 664 {} \;
        chmod 755 $HOME
    fi
}



function setperms()
{
    echo "setting proper permissions in ~/"
    private
    public
}



function wwwrc()
{
    alias mv="mv"
    mv -f ~/.[a-z]*.html ~/public_html/
    chmod 644 ~/public_html/.[a-z]*.html
    chown $USER:www-data ~/public_html/.[a-z]*.html
    alias mv="mv -i"
}



##################################################
# Backup .bash* files				 #
##################################################

function backup_bashfiles()
{
  ARCHIVE="$HOME/bash_dotfiles_$(date +%Y%m%d_%H%M%S).tar.gz";
  cd ~
  tar -czvf $ARCHIVE .bash_profile .bashrc .bash_functions .bash_aliases .bash_prompt
  echo "All backed up in $ARCHIVE";
}



##################################################
# Creates a backup of the file passed as	 #
# parameter with the date and time		 #
##################################################

function bak()
{
  cp $1 $1_`date +%H:%M:%S_%d-%m-%Y`
}



##################################################
# Good bash tips for everyone			 #
##################################################

function bashtips() {
# copyright 2007 - 2010 Christopher Bratusek
cat <<EOF
DIRECTORIES
-----------
~-          Previous working directory
pushd tmp   Push tmp && cd tmp
popd        Pop && cd
GLOBBING AND OUTPUT SUBSTITUTION
--------------------------------
ls a[b-dx]e Globs abe, ace, ade, axe
ls a{c,bl}e Globs ace, able
\$(ls)      \`ls\` (but nestable!)
HISTORY MANIPULATION
--------------------
!!        Last command
!?foo     Last command containing \`foo'
^foo^bar^ Last command containing \`foo', but substitute \`bar'
!!:0      Last command word
!!:^      Last command's first argument
!\$       Last command's last argument
!!:*      Last command's arguments
!!:x-y    Arguments x to y of last command
C-s       search forwards in history
C-r       search backwards in history
LINE EDITING
------------
M-d     kill to end of word
C-w     kill to beginning of word
C-k     kill to end of line
C-u     kill to beginning of line
M-r     revert all modifications to current line
C-]     search forwards in line
M-C-]   search backwards in line
C-t     transpose characters
M-t     transpose words
M-u     uppercase word
M-l     lowercase word
M-c     capitalize word
COMPLETION
----------
M-/     complete filename
M-~     complete user name
M-@     complete host name
M-\$    complete variable name
M-!     complete command name
M-^     complete history
EOF
}



##################################################
# Execute a given Linux command on a group of	 #
# files						 #
##################################################

###### Example: batchexec sh ls		# lists all files that have the extension 'sh'
# Example: batchexec sh chmod 755	# 'chmod 755' all files that have the extension 'sh'
function batchexec()
{
find . -type f -iname '*.'${1}'' -exec ${@:2}  {} \; ;
}



##################################################
# Clock - A bash clock that can run in your	 #
# terminal window.				 #
##################################################

###### binary clock
function bclock()
{
watch -n 1 'echo "obase=2;`date +%s`" | bc'
}



###### binary clock
function bclock2()
{
perl -e 'for(;;){@d=split("",`date +%H%M%S`);print"\r";for(0..5){printf"%.4b ",$d[$_]}sleep 1}'
}



function clock()
{
while true;do clear;echo "===========";date +"%r";echo "===========";sleep 1;done
}



##################################################
# Appends a '&' to a command so it will run in 	 #
# the background				 #
##################################################

###### useful for aliases
function bg_wrapper()
{
    "$@" &
}



##################################################
# Substitutes underscores for blanks in all the  #
# filenames in a directory			 #
##################################################

function blank_rename()
{
ONE=1                     # For getting singular/plural right (see below).
number=0                  # Keeps track of how many files actually renamed.
FOUND=0                   # Successful return value.
for filename in *         #Traverse all files in directory.
do
     echo "$filename" | grep -q " "         #  Check whether filename
     if [ $? -eq $FOUND ]                   #+ contains space(s).
     then
       fname=$filename                      # Yes, this filename needs work.
       n=`echo $fname | sed -e "s/ /_/g"`   # Substitute underscore for blank.
       mv "$fname" "$n"                     # Do the actual renaming.
       let "number += 1"
     fi
done
if [ "$number" -eq "$ONE" ]                 # For correct grammar.
then
 echo "$number file renamed."
else
 echo "$number files renamed."
fi
}


##################################################
# Bookmarking 					 #
##################################################

###### bookmarking the current directory in 'alias' form
function bookmark() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $1 != "" && $(alias | grep -w go-$1) == "" ]]; then
		echo "alias go-$1='cd $PWD'" >> $HOME/.bookmarks
		. $HOME/.bookmarks
	elif [[ $1 == "" ]]; then
		echo "need name for the bookmark."
	else	echo "bookmark go-$1 already exists."
	fi
}



function unmark() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $(alias | grep -w go-$1= ) != "" ]]; then
		sed -e "/go-$1/d" -i $HOME/.bookmarks
		xunalias go-$1
	fi
}



###### copies/moves files to a bookmarked dir
# cto file1.jpg file2.jpg file3.jpg pics
function cto() {
    eval lastarg=\${$#}
    targetdir=`getBookmark $lastarg`
    echo "Copying files to $targetdir"
    if [ -n "$targetdir" ]; then
        for dir in "$@";
            do
                if [ "$dir" != $lastarg ]; then
                    cp -iv "$dir" "$targetdir"
                fi
            done
    fi
}



# mto vid1.avi vid2.avi videos
function mto() {
    eval lastarg=\${$#}
    targetdir=`getBookmark $lastarg`
    echo "Moving files to $targetdir"
    if [ -n "$targetdir" ]; then
        for dir in "$@";
            do
                if [ "$dir" != $lastarg ]; then
                    mv -iv "$dir" "$targetdir"
                fi
            done
    fi
}



###### Directory Bookmarks for BASH (c) 2009, Ira Chayut, Version 090927
# DirB and its implementation in this file are the product of, and
# copyrighted by Ira Chayut.  You are granted a non-exclusive, royalty-free
# license to use, reproduce, modify and create derivative works from DirB;
# providing that credit is given to DirB as a source material.
# The lastest version is available from: http://www.dirb.info/bashDirB.  Ira can
# be reached at ira@dirb.info.
# By default DirB will have the shell echo the current working directory out
# to the title bars of Xterm windows.  To disable this behavior, comment
# out the next line.
# PS1="\[\033]0;\w\007\]\t \!> "
# If the repository of bookmarks does not exist, create it
if  [ ! -e ~/.DirB ]
then
    mkdir ~/.DirB
fi



###### "d" - Display (or Dereference) a saved bookmark
# to use: cd "$(d xxx)"
function d() {
    # if the bookmark exists, then extract its directory path and print it
    if [ -e ~/.DirB/"$1" ]
    then
        sed -e 's/\$CD //' -e 's/\\//g' ~/.DirB/"$1"

    # if the bookmark does not exists, complain and exit with a failing code
    else
        echo bash: DirB: ~/.DirB/"$1" does not exist >&2
        false
    fi
}



###### "g" - Go to bookmark
function g() {
    # if no arguments, then just go to the home directory
    if [ -z "$1" ]
    then
        cd
    else
        # if $1 is in ~/.DirB and does not begin with ".", then go to it
        if [ -f ~/.DirB/"$1" -a ${1:0:1} != "." ]
        then
            # update the bookmark's timestamp and then execute it
            touch ~/.DirB/"$1" ;
            CD=cd source ~/.DirB/"$1" ;
        # else just do a "cd" to the argument, usually a directory path of "-"
        else
            cd "$1"
        fi
    fi
}



###### "p" - Push a bookmark
function p() {
    # Note, the author's preference is to list the directory stack in a single
    # column.  Thus, the standard behavior of "pushd" and "popd" have been
    # replaced by discarding the normal output of these commands and using a
    # "dirs -p" after each one.

    # if no argument given, then just pushd and print out the directory stack
    if [ -z "$1" ]
    then
        pushd > /dev/null && dirs -p

    # if $1 is a dash, then just do a "popd" and print out the directory stack
    elif [ "$1" == "-" ]
    then
        popd > /dev/null
        dirs -p
    else
        # if $1 is in ~/.DirB and does not begin with ".", then go to it
        # and then print out the directory stack
        if [ -f ~/.DirB/"$1" -a "${1:0:1}" != "." ]
            then
                touch ~/.DirB/$1 ;
                CD=pushd source ~/.DirB/$1 > /dev/null && dirs -p ;

        # else just do a "pushd" and print out the directory stack
        else
            pushd "$1" > /dev/null && dirs -p
        fi
    fi
}



###### "r" - Remove a saved bookmark
function r() {
    # if the bookmark file exists, remove it
    if [ -e ~/.DirB/"$1" ]
    then
        rm ~/.DirB/"$1"

    # if the bookmark file does not exist, complain and exit with a failing code
    else
        echo bash: DirB: ~/.DirB/"$1" does not exist >&2
        false
    fi
}



###### "s" - Save bookmark
function s() {
    if [ -n "$2" ]
    then
        # build the bookmark file with the contents "$CD directory_path"
        ( echo '$CD ' \"$2\" > ~/.DirB/"$1" ;) > /dev/null 2>&1
    else
        # build the bookmark file with the contents "$CD directory_path"
        ( echo -n '$CD ' > ~/.DirB/"$1" ;
          pwd | sed "s/ /\\\\ /g" >> ~/.DirB/"$1" ; ) > /dev/null 2>&1
    fi
    # if the bookmark could not be created, print an error message and
    # exit with a failing return code
    if [ $? != 0 ]
    then
        echo bash: DirB: ~/.DirB/"$1" could not be created >&2
        false
    fi
}



###### "sl" - Saved bookmark Listing
function sl() {
    # if the "-l" argument is given, then do a long listing, passing any
    # remaining arguments to "ls", printing in reverse time order.  Pass the
    # output to "less" to page the output if longer than a screen in length.
    if [ "$1" == "-l" ]
    then
        shift
        ( cd ~/.DirB ;
        ls -lt $* |
            sed -e 's/  */ /g' -e '/^total/d' \
                -e 's/^\(... \)\([0-9] \)/\1 \2/' |
            cut -d ' ' -s -f6- | sed -e '/ [0-9] /s// &/' | less -FX ; )

    # else print the short form of the bookmarks in reverse time order
    else
        ( cd ~/.DirB ; ls -xt $* ; )
    fi
}



###### simple bookmark system
function getBookmark() {
    case "$1" in
    video|vids|vid) echo "~/Videos" ;; # video, vids and vid are shortcuts to use with the functions below, the bookmarked directory is "~/videos"
    images|img|pics|pictures) echo "~/Pictures";;
    *) echo "" ;;
    esac
}



###### list contents of a bookmarked dir without
# going there: list vids
function list() {
    dir=`getBookmark $1`
    echo $dir
    if [ -n "$dir" ]; then
        ls "$dir"
    fi
}



###### same as "list" but with details: llist vids
function llist() {
    dir=`getBookmark $1`
    echo $dir
    if [ -n "$dir" ]; then
        ll "$dir"
    fi
}



##################################################
# Create box of '#' characters around given 	 #
# string					 #
##################################################

function box() { t="$1xxxx";c=${2:-#}; echo ${t//?/$c}; echo "$c $1 $c"; echo ${t//?/$c}; }



##################################################
# Download all videos in your Boxee queue	 #
##################################################

# Gets all videos in your boxee queue with a URL associated with them and attempts to download each using get_flash_videos
function boxeedl()
{
for i in $(curl -u <username> http://app.boxee.tv/api/get_queue | xml2 | grep /boxeefeed/message/object/url | cut -d "=" -f 2,3); do get_flash_videos $i; done
}


##################################################
# Backup a file with a date-time stamp		 #
##################################################

# Usage "bu filename.txt"
function bu() { cp $1 ${1}-`date +%Y%m%d%H%M`.backup ; }



function buf() { cp -v $1 ${1/${1%%.*}/$f-$(date +"%Y%m%d_%H%M%S")}; }



##################################################
# Buffer in order to avoir mistakes with 	 #
# redirections that empty your files		 #
##################################################

function buffer() { tty -s && return; tmp=$(mktemp); cat > "${tmp}"; if [ -n "$1" ] && ( ( [ -f "$1" ] && [ -w "$1" ] ) || ( ! [ -a "$1" ] && [ -w "$(dirname "$1")" ] ) ); then mv -f "${tmp}" "$1"; else echo "Can't write in \"$1\""; rm -f "${tmp}"; fi }



##################################################
# Generate a case-insensitive pattern		 #
##################################################

function casepat() { perl -pe 's/([a-zA-Z])/sprintf("[%s%s]",uc($1),$1)/ge' ; }



##################################################
# Concatenate PDF files				 #
##################################################

###### e.g. cat_pdfs -o combined.pdf file1.pdf file2.pdf file3.pdf
function cat_pdfs() { python '/System/Library/Automator/Combine PDF Pages.action/Contents/Resources/join.py' "$@" ; }


##################################################
# Power cd (add some of useful features to 'cd') #
##################################################

###### Move efficiently between directories.
# This command adds a couple of extra features to cd, without affecting normal use.
# CDPATH use is also unaffected. It introduces and environment variable CDDIR which is used as an alternate home directory.
# `export CDDIR="$HOME/work"` and `alias cdd="CDDIR=$(pwd)"` must also be uncommented/enabled for this to work
function cd() { if [ -n "$1" ]; then [ -f "$1" ] && set -- "${1%/*}"; else [ -n "$CDDIR" ] && set -- "$CDDIR"; fi; command cd "$@"; }



alias cdd="CDDIR=$(pwd)"



##################################################
# Change directory and list files		 #
##################################################

function cdls() {
    # only change directory if a directory is specified
    [ -n "${1}" ] && cd $1
    lls
}



##################################################
# Checksum					 #
##################################################

function checksum()
# copyright 2007 - 2010 Christopher Bratusek
{
	action=$1
	shift
	if [[ ( $action == "-c" || $action == "--check" ) && $1 == *.* ]]; then
		type="${1/*./}"
	else	type=$1
		shift
	fi
	case $type in
		md5 )
			checktool=md5sum
		;;
		sha1 | sha )
			checktool=sha1sum
		;;
		sha224 )
			checktool=sha224sum
		;;
		sha256 )
			checktool=sha256sum
		;;
		sha384 )
			checktool=sha384sum
		;;
		sha512 )
			checktool=sha512sum
		;;
	esac
	case $action in
		-g | --generate )
			for file in "${@}"; do
				$checktool "${file}" > "${file}".$type
			done
		;;
		-c | --check )
			for file in "${@}"; do
				if [[ "${file}" == *.$type ]]; then
					$checktool --check "${file}"
				else	$checktool --check "${file}".$type
				fi
			done
		;;
		-h | --help )
		;;
	esac
}



###### MD5 checksum
function md5()
{
    echo -n $@ | md5sum
}



###### Encode a string in md5 hash of 32 characters
# You can short the length with the second parameter.
#  @param string $1 string (required)
#  @param integer $2 length (option, default: 32)
#  @return string
#  @example:    md5 "Hello World" 8
function md5_() {
      local length=${2:-32}
      local string=$( echo "$1" | md5sum | awk '{ print $1 }' )
      echo ${string:0:${length}}
}



##################################################
# Mount/unmount CIFS shares; pseudo-		 #
# replacement for smbmount			 #
##################################################

######   $1 = remote share name in form of //server/share
#   $2 = local mount point
function cifsmount() { sudo mount -t cifs -o username=${USER},uid=${UID},gid=${GROUPS} $1 $2; }



function cifsumount() { sudo umount $1; }



##################################################
# Commandlinefu.com and Shell-fu.org stuff	 #
##################################################

###### Search commandlinefu.com from the command line
# using the API
# Usage: cmdfu hello world
function cmdfu() { curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext" --silent | sed "s/\(^#.*\)/\x1b[32m\1\x1b[0m/g" | less -R ; }



# function cmdfu() { curl "http://www.commandlinefu.com/commands/matching/$@/$(echo -n $@ | openssl base64)/plaintext"; }



###### automatically downloads all commands from http://www.commandlinefu.com into a single text file
alias cmdfu_dl='mkdir /tmp/commandlinefu && cd /tmp/commandlinefu && curl -O http://www.commandlinefu.com/commands/browse/sort-by-votes/plaintext/[0-2400:25] && ls -1 | sort -n | while read mork ; do cat $mork >> commandlinefu.txt ; ls -ald $mork; done && mv commandlinefu.txt $HOME && rm -rf /tmp/commandlinefu'



###### find a CommandlineFu users average command rating
function cmdfu_rating()
{
wget -qO- www.commandlinefu.com/commands/by/PhillipNordwall | awk -F\> '/class="num-votes"/{S+=$2; I++}END{print S/I}'
}



function cmdfu_rating_()
{
curl -s www.commandlinefu.com/commands/by/PhillipNordwall | awk -F\> '/class="num-votes"/{S+=$2; I++}END{print S/I}'
}



##### key binding to search commandlinefu.com
function ds_() { echo -n "search : "; read ST; EST=`php -r "echo rawurlencode('$ST');"`; B64=`echo -n $ST| openssl enc -base64`; curl -s "http://www.commandlinefu.com/commands/matching/$EST/$B64/plaintext" | less -p "$ST"; } ; bind '"\C-k"':"\"ds\C-m\""



###### command examples from shell-fu
function examples() { lynx -width=$COLUMNS -nonumbers -dump "http://www.shell-fu.org/lister.php?tag=$1" | \
sed -n '/^[a-zA-Z]/,$p' | egrep -v '^http|^javas|View Comm|HIDE|] \+|to Share|^ +\*|^ +[HV][a-z]* l|^ .*efu.*ep.*!$' | \
sed -e '/^  *__*/N;s/\n$//g' | less -r; }



###### fuman, an alternative to the 'man' command that shows commandlinefu.com examples
function fuman() { lynx -width=$COLUMNS -nonumbers -dump "http://www.commandlinefu.com/commands/using/$1" |sed '/Add to favourites/,/This is sample output/!d' |sed 's/ *Add to favourites/----/' |less -r; }



###### Random Commandlinefu command
function fur() { curl -sL 'http://www.commandlinefu.com/commands/random/plaintext' | grep -v "^# commandlinefu" ; }



###### Prepare a commandlinefu command
function goclf()
{
type "$1" | sed '1d' | tr -d "\n" | tr -s '[:space:]'; echo
}



##################################################
# What package does that command come from?	 #
##################################################

function cmdpkg() { PACKAGE=$(dpkg -S $(which $1) | cut -d':' -f1); echo "[${PACKAGE}]"; dpkg -s "${PACKAGE}" ;}



##################################################
# Sets custom Catalog Number ID3 tag for all	 #
# MP3 files in current directory		 #
##################################################

###### $1 = catalog number
function cn() { for i in *.mp3; do id3v2 --TXXX "Catalog Number":"$1" "$i"; done; }



##################################################
# View daily comics (set on Viewnior as image	 #
# viewer...can use 'eog' or whatever instead)	 #
##################################################

function comics() {
	# xkcd
	XKCD_FILE="/tmp/xkcd"
	wget -q $(curl -s http://xkcd.com/ | sed -n 's/<h3>Image URL.*: \(.*\)<\/h3>/\1/p') -O $XKCD_FILE
	# Geek and Poke
	GAP_FILE="/tmp/geekandpoke"
	wget -q $(lynx --dump 'http://geekandpoke.typepad.com/' | grep '\/.a\/' | grep '\-pi' | head -n 1 | awk '{print $2}') -O $GAP_FILE
	viewnior $XKCD_FILE
	viewnior $GAP_FILE
}

##################################################
# Run command/program using a timer		 #
##################################################

###### Run a command until a specified time
# Example: command-timer 04:00
function command-timer() { echo "notify-send TimeToQuit" | at "$@" ; }



###### Run a program on a timer
# Example: program-timer 20 viewnior arg1
function program-timer() { perl -e 'alarm shift; exec @ARGV' "$@" & exit; }



##################################################
# Computer the speed of two commands		 #
##################################################

function comp() { # compare the speed of two commands (loop $1 times)
  if [[ $# -ne 3 ]] ; then return 1 ; fi
  echo -n 1
  time for ((i=0;i<$1;i++)) ; do $2 ; done >/dev/null 2>&1
  echo -n 2
  time for ((i=0;i<$1;i++)) ; do $3 ; done >/dev/null 2>&1
}


##################################################
# Compress stuff				 #
##################################################

function compress_() {
   # Credit goes to: Daenyth
   FILE=$1
   shift
   case $FILE in
      *.tar.bz2) tar cjf $FILE $*  ;;
      *.tar.gz)  tar czf $FILE $*  ;;
      *.tgz)     tar czf $FILE $*  ;;
      *.zip)     zip $FILE $*      ;;
      *.rar)     rar $FILE $*      ;;
      *)         echo "Filetype not recognized" ;;
   esac
}



##################################################
# Sets the compression level for file-roller	 #
##################################################

function compression_level()
{
echo -n "Please enter the number for the compression level desired:

(1) very_fast
(2) fast
(3) normal
(4) maximum

Press 'Enter' for default (default is '3')...

"
read COMPRESSION_LEVEL_NUMBER
# extra blank space
echo "
"
# default
if [[ -z $COMPRESSION_LEVEL_NUMBER ]] ; then
# If no COMPRESSION_LEVEL passed, default to '3'
    COMPRESSION_LEVEL=normal
fi
# preset
if [[ $COMPRESSION_LEVEL_NUMBER = 1 ]] ; then
    COMPRESSION_LEVEL=very_fast
fi
if [[ $COMPRESSION_LEVEL_NUMBER = 2 ]] ; then
    COMPRESSION_LEVEL=fast
fi
if [[ $COMPRESSION_LEVEL_NUMBER = 3 ]] ; then
    COMPRESSION_LEVEL=normal
fi
if [[ $COMPRESSION_LEVEL_NUMBER = 4 ]] ; then
    COMPRESSION_LEVEL=maximum
fi

gconftool-2 --set /apps/file-roller/general/compression_level --type string "$COMPRESSION_LEVEL"
}


##################################################
# Count files in current directory		 #
##################################################

function count_files()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*+h)
			echo $(($(ls --color=no -1 -la . | grep -v ^l | wc -l)-1))
		;;
		*-h)
			echo $(($(ls --color=no -1 -l . | grep -v ^l | wc -l)-1))
		;;
		*+d)
			echo $(($(ls --color=no -1 -la . | grep -v ^- | wc -l)-1))
		;;
		*-d)
			echo $(($(ls --color=no -1 -l . | grep -v ^- | wc -l)-1))
		;;
		*+f)
			echo $(($(ls --color=no -1 -la . | grep -v ^d | wc -l)-1))
		;;
		*-f)
			echo $(($(ls --color=no -1 -l . | grep -v ^d | wc -l)-1))
		;;
		*)
			echo -e "\n${ewhite}Usage:"
			echo -e "\n${eorange}count_files${ewhite} | ${egreen}+h ${eiceblue}[count files and folders - include hidden ones] \
			\n${eorange}count_files${ewhite} | ${egreen}-h ${eiceblue}[count files and folders - exclude hidden ones] \
			\n${eorange}count_files${ewhite} | ${egreen}+d ${eiceblue}[count folders - include hidden ones] \
			\n${eorange}count_files${ewhite} | ${egreen}-d ${eiceblue}[count folders - exclude hidden ones] \
			\n${eorange}count_files${ewhite} | ${egreen}+f ${eiceblue}[count files - include hidden ones] \
			\n${eorange}count_files${ewhite} | ${egreen}-f ${eiceblue}[count files - exclude hidden ones]\n"
			tput sgr0
		;;
	esac
}



##################################################
# Count files by extension 			 #
##################################################

function count_files_by_ext() { find . -type f | sed -n 's/..*\.//p' | sort -f | uniq -ic ; }



##################################################
# Count processes that are running		 #
##################################################

function count_processes()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*help )
			echo -e "\n${ewhite}Usage:"
			echo -e "\n${eorange}count_processes${ewhite} | ${egreen}! no options !\n"
			tput sgr0
		;;
		* )
			procs=$(ps ax | wc -l | awk '{print $1}')
			if [[ $procs -lt 10 ]]; then
				echo "000$procs"
			elif [[ $procs -lt 100 ]]; then
				echo "00$procs"
			elif [[ $procs -lt 1000 ]]; then
				echo "0$procs"
			fi
		;;
	esac
}


##################################################
# Cp with progress bar (using pv)		 #
##################################################

function cp_p() {
	if [ `echo "$2" | grep ".*\/$"` ]
	then
		pv "$1" > "$2""$1"
	else
		pv "$1" > "$2"/"$1"
	fi
}



##################################################
# Create User List				 #
##################################################

function create_user_list()
# Author: Josh Bailey
# Email: jbsnake <at> <no spam> usalug.org
# further tweaked by: jsz
# usage: create_user_list
{
    local users u
    while IFS=: read -r u _; do
        users+=("$u")
    done
    printf '%s\n' "${users[@]:1}"
}



##################################################
# Print a cron formatted time for 2 minutes in 	 #
# the future (for crontab testing)		 #
##################################################

function crontest() { date '-d +2 minutes' +'%M %k %d %m *'; }



##################################################
# Encryption / decryption			 #
##################################################

###### do twice to decrypt
# copyright 2007 - 2010 Christopher Bratusek
function crypt() {
	if [[ -e "$1" ]]; then
		tr a-zA-Z n-za-mN-ZA-M < "$1" > "$1".crypt
		rm -f "$1"
		mv "$1".crypt "$1"
	fi
}



###### basic encrypt / decrypt
# example: "encry filename" or "decry filename"
function encry()
{
gpg -ac --no-options "$1"
}



function decry()
{
gpg --no-options "$1"
}



###### More advanced encryption / decryption
# example: "encrypt filename" or "decrypt filename"
function encrypt()
{
# Author: Martin Langasek <cz4160@gmail.com>
case $LANG in
  cs* )
    err_title="Chyba"
    err_files="Neoznačen soubor"
    encrypt="Šifrovat"
    decrypt="Dešifrovat"
    file_msg="soubor:"
    pass_msg="Vložte heslo";;
  * )
    err_title="Error"
    err_files="No file selected"
    encrypt="Encrypt"
    decrypt="Decrypt"
    file_msg="file:"
    pass_msg="Enter passphrase";;
esac
if [ "$1" != "" ]
then
  i=1
  file=`echo "$1" | sed ''$i'!d'`
  while [ "$file" != "" ]
  do
    ext=`echo "$file" | grep [.]gpg$ 2>&1`
    if [ "$ext" != "" ]
    then
      pass_decrypt=`zenity --entry --entry-text "$pass_decrypt" --hide-text --title "$pass_msg" --text "$decrypt $file_msg ${file##*/}" "" 2>&1`
      if [ "$pass_decrypt" != "" ]
      then
        output=${file%.*}
        echo "$pass_decrypt" | gpg -o "$output" --batch --passphrase-fd 0 -d "$file"
      fi
    else
      pass_encrypt=`zenity --entry --hide-text --entry-text "$pass_encrypt" --title "$pass_msg" --text "$encrypt $file_msg ${file##*/}" "" 2>&1`
      if [ "$pass_encrypt" != "" ]
      then
        echo "$pass_encrypt" | gpg --batch --passphrase-fd 0 --cipher-algo aes256 -c "$file"
      fi
    fi
    i=$(($i+1))
    file=`echo "$1" | sed ''$i'!d'`
  done
else
  zenity --error --title "$err_title" --text "$err_files"
fi
}



alias decrypt='encrypt'



###### rot13 ("rotate alphabet 13 places" Caesar-cypher encryption)
function rot13()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "Seriously?  You don't know what rot13 does?"
    else
        echo $@ | tr A-Za-z N-ZA-Mn-za-m
    fi
}



###### rot47 ("rotate ASCII characters from '!" to '~' 47 places" Caesar-cypher encryption)
function rot47()
{
    if [ $# -lt 1 ] || [ $# -gt 1 ]; then
        echo "Seriously?  You don't know what rot47 does?"
    else
        echo $@ | tr '!-~' 'P-~!-O'
    fi
}



##################################################
# Google stuff					 #
##################################################

###### convert currencies
# usage:	currency_convert 1 usd eur
# for currency shorthand: http://www.xe.com/currency/
function currency_convert() { wget -qO- "http://www.google.com/finance/converter?a=$1&from=$2&to=$3&hl=es" | sed '/res/!d;s/<[^>]*>//g'; }



function currency_convert_() { curl "http://www.xe.com/wap/2co/convert.cgi?Amount=$1&From=$2&To=$3" -A "Mozilla" -s | sed -n "s/.*>\(.*\) $3<.*/\1/p"; }



function currency_convert_help() {
cat <<EOF
AED - Emirati Dirham
AFN - Afghan Afghani
ALL - Albanian Lek
AMD - Armenian Dram
ANG - Dutch Guilder
AOA - Angolan Kwanza
ARS - Argentine Peso
AUD - Australian Dollar
AWG - Aruban or Dutch Guilder
AZN - Azerbaijani New Manat
BAM - Bosnian Convertible Marka
BBD - Barbadian or Bajan Dollar
BDT - Bangladeshi Taka
BGN - Bulgarian Lev
BHD - Bahraini Dinar
BIF - Burundian Franc
BMD - Bermudian Dollar
BND - Bruneian Dollar
BOB - Bolivian Boliviano
BRL - Brazilian Real
BSD - Bahamian Dollar
BTN - Bhutanese Ngultrum
BWP - Batswana Pula
BYR - Belarusian Ruble
BZD - Belizean Dollar
CAD - Canadian Dollar
CDF - Congolese Franc
CHF - Swiss Franc
CLP - Chilean Peso
CNY - Chinese Yuan Renminbi
COP - Colombian Peso
CRC - Costa Rican Colon
CUC - Cuban Convertible Peso
CUP - Cuban Peso
CVE - Cape Verdean Escudo
CZK - Czech Koruna
DJF - Djiboutian Franc
DKK - Danish Krone
DOP - Dominican Peso
DZD - Algerian Dinar
EEK - Estonian Kroon
EGP - Egyptian Pound
ERN - Eritrean Nakfa
ETB - Ethiopian Birr
EUR - Euro
FJD - Fijian Dollar
FKP - Falkland Island Pound
GBP - British Pound
GEL - Georgian Lari
GGP - Guernsey Pound
GHS - Ghanaian Cedi
GIP - Gibraltar Pound
GMD - Gambian Dalasi
GNF - Guinean Franc
GTQ - Guatemalan Quetzal
GYD - Guyanese Dollar
HKD - Hong Kong Dollar
HNL - Honduran Lempira
HRK - Croatian Kuna
HTG - Haitian Gourde
HUF - Hungarian Forint
IDR - Indonesian Rupiah
ILS - Israeli Shekel
IMP - Isle of Man Pound
INR - Indian Rupee
IQD - Iraqi Dinar
IRR - Iranian Rial
ISK - Icelandic Krona
JEP - Jersey Pound
JMD - Jamaican Dollar
JOD - Jordanian Dinar
JPY - Japanese Yen
KES - Kenyan Shilling
KGS - Kyrgyzstani Som
KHR - Cambodian Riel
KMF - Comoran Franc
KPW - Korean Won
KRW - Korean Won
KWD - Kuwaiti Dinar
KYD - Caymanian Dollar
KZT - Kazakhstani Tenge
LAK - Lao or Laotian Kip
LBP - Lebanese Pound
LKR - Sri Lankan Rupee
LRD - Liberian Dollar
LSL - Basotho Loti
LTL - Lithuanian Litas
LVL - Latvian Lat
LYD - Libyan Dinar
MAD - Moroccan Dirham
MDL - Moldovan Leu
MGA - Malagasy Ariary
MKD - Macedonian Denar
MMK - Burmese Kyat
MNT - Mongolian Tughrik
MOP - Macau Pataca
MRO - Mauritian Ouguiya
MUR - Mauritian Rupee
MVR - Maldivian Rufiyaa
MWK - Malawian Kwacha
MXN - Mexican Peso
MYR - Malaysian Ringgit
MZN - Mozambican Metical
NAD - Namibian Dollar
NGN - Nigerian Naira
NIO - Nicaraguan Cordoba
NOK - Norwegian Krone
NPR - Nepalese Rupee
NZD - New Zealand Dollar
OMR - Omani Rial
PAB - Panamanian Balboa
PEN - Peruvian Nuevo Sol
PGK - Papua New Guinean Kina
PHP - Philippine Peso
PKR - Pakistani Rupee
PLN - Polish Zloty
PYG - Paraguayan Guarani
QAR - Qatari Riyal
RON - Romanian New Leu
RSD - Serbian Dinar
RUB - Russian Ruble
RWF - Rwandan Franc
SAR - Saudi or Saudi Arabian Riyal
SBD - Solomon Islander Dollar
SCR - Seychellois Rupee
SDG - Sudanese Pound
SEK - Swedish Krona
SGD - Singapore Dollar
SHP - Saint Helenian Pound
SLL - Sierra Leonean Leone
SOS - Somali Shilling
SPL - Seborgan Luigino
SRD - Surinamese Dollar
STD - Sao Tomean Dobra
SVC - Salvadoran Colon
SYP - Syrian Pound
SZL - Swazi Lilangeni
THB - Thai Baht
TJS - Tajikistani Somoni
TMT - Turkmenistani Manat
TND - Tunisian Dinar
TOP - Tongan Pa'anga
TRY - Turkish Lira
TTD - Trinidadian Dollar
TVD - Tuvaluan Dollar
TWD - Taiwan New Dollar
TZS - Tanzanian Shilling
UAH - Ukrainian Hryvna
UGX - Ugandan Shilling
USD - US Dollar
UYU - Uruguayan Peso
UZS - Uzbekistani Som
VEF - Venezuelan Bolivar Fuerte
VND - Vietnamese Dong
VUV - Ni-Vanuatu Vatu
WST - Samoan Tala
XAF - Central African CFA Franc BEAC
XCD - East Caribbean Dollar
XDR - IMF Special Drawing Rights
XOF - CFA Franc
XPF - CFP Franc
YER - Yemeni Rial
ZAR - South African Rand
ZMK - Zambian Kwacha
ZWD - Zimbabwean Dollar
EOF
}



###### define a word - USAGE: define dog
function define() {
  local LNG=$(echo $LANG | cut -d '_' -f 1)
  local CHARSET=$(echo $LANG | cut -d '.' -f 2)
  lynx -accept_all_cookies -dump -hiddenlinks=ignore -nonumbers -assume_charset="$CHARSET" -display_charset="$CHARSET" "http://www.google.com/search?hl=${LNG}&q=define%3A+${1}&btnG=Google+Search" | grep -m 5 -C 2 -A 5 -w "*" > /tmp/define
  if [ ! -s /tmp/define ]; then
    echo "Sorry, google doesn't know this one..."
    rm -f /tmp/define
    return 1
  else
    cat /tmp/define | grep -v Search
    echo ""
  fi
  rm -f /tmp/define
  return 0
}



###### detect language of a string
function detectlanguage() { curl -s "http://ajax.googleapis.com/ajax/services/language/detect?v=1.0&q=$@" | sed 's/{"responseData": {"language":"\([^"]*\)".*/\1\n/'; }



###### find a location's coordinates
# usage:	findlocation "Las Vegas, Nevada" = coordinates: [ -115.1728160, 36.1146460, 0 ]
function findlocation() { place=`echo $1 | sed 's/ /%20/g'` ; curl -s "http://maps.google.com/maps/geo?output=json&oe=utf-8&q=$place" | grep -e "address" -e "coordinates" | sed -e 's/^ *//' -e 's/"//g' -e 's/address/Full Address/';}



###### your GeoIP location on Google Maps
function geoipme()
{
curl -s http://geoiplookup.wikimedia.org/|awk -F, '{print $3,$4}'|awk -F'"' '{print "http://maps.google.com/maps?q="$4 "," $8}'
}



###### Google search (example: google dog)
function google() {
firefox "http://www.google.com/search?&num=100&q=${@}" &
}



###### Google chart
function google_chart()
{
wget -O chart.png 'http://chart.googleapis.com/chart?chs=250x100&chd=t:60,40&cht=p3&chl=Hello|World'
}



###### Google search (example: google dog)
function google-fonts() {
# Google-Fonts.sh
# Version: 		0.1
# Last modified: 	04 November 2011
# License:		GPLv3+
# Creator:		Inameiname
#
# Credit also goes to Michalis Georgiou
# <mechmg93@gmail.com> for his original
# google-font script and to Andrew
# http://www.webupd8.org <andrew@webupd8.org> for
# his further modification of it.
#
# Descripton:
# For those who want an extremely easy method to
# download and install the entire Google font
# repository.
###### Installation of Mercurial Needed for Downloading of Fonts ######
sudo apt-get install mercurial
###### Setting of Default Directories ######
_hgroot="https://googlefontdirectory.googlecode.com/hg/"
_hgrepo="googlefontdirectory"
_hgoutdir="google-fonts"
###### Google Font Choice Decision ######
echo "
"
echo -n "What do you want to do with the fonts from Google
once they are downloaded?:

(1)  Download Only (and keep all fonts in a single folder)
(2)  Download Only (and keep all fonts in separate folders (pure hg copy))
(3)  Download and Install

Press 'Enter' for default (default is '1')...

"
read GOOGLE_FONT_CHOICE
###### Actual Downloading of the Google Fonts ######
if [ ! -d $HOME/$_hgrepo ] ; then
echo "
"
echo "Connecting to Mercurial server...."
if [ -d $HOME/$_hgrepo ] ; then
	cd $HOME/$_hgrepo
	hg pull -u || return 1
	echo "The local files have been updated."
	cd ..
else
	hg clone $_hgroot $HOME/$_hgrepo || return 1
fi
echo "Mercurial checkout done or server timeout"
echo "
"
else
echo "The directory $HOME/$_hgrepo already exists."
echo ""
echo "No need to redownload all of the Google fonts."
fi
###### Google Font Choice Selection ######
###### default
if [[ -z $GOOGLE_FONT_CHOICE ]] ; then
	# If no file passed, default to 1
	mkdir -p $HOME/$_hgoutdir/
	find $HOME/$_hgrepo/ -name "*.ttf"|xargs -I{} bash -c "cp -rf \"{}\" $HOME/$_hgoutdir/"
	rm -rf $HOME/$_hgrepo/
fi
###### preset
if [[ $GOOGLE_FONT_CHOICE = 1 ]] ; then
	mkdir -p $HOME/$_hgoutdir/
	find $HOME/$_hgrepo/ -name "*.ttf"|xargs -I{} bash -c "cp -rf \"{}\" $HOME/$_hgoutdir/"
	rm -rf $HOME/$_hgrepo/
fi
if [[ $GOOGLE_FONT_CHOICE = 2 ]] ; then
	mv $HOME/$_hgrepo/ $HOME/$_hgoutdir/
fi
if [[ $GOOGLE_FONT_CHOICE = 3 ]] ; then
	sudo mkdir -p /usr/share/fonts/truetype/google-fonts/
	find $HOME/$_hgrepo/ -name "*.ttf" -exec sudo install -m644 {} /usr/share/fonts/truetype/google-fonts/ \; || return 1
	fc-cache -f > /dev/null
	rm -rf $HOME/$_hgrepo/
fi
###### Wrap Up ######
echo "
"
echo "done."
echo "
"
read -sn 1 -p "You have finished downloading/installing all the Google Fonts currently available. Press any key to finish...
"
}



###### get Google PageRank
function pagerank()
{
curl pagerank.bz/$1
}



###### Google text-to-speech in mp3/wav format
function say() { mplayer -user-agent Mozilla "http://translate.google.com/translate_tts?tl=en&q=$(echo $* | sed 's#\ #\+#g')" > /dev/null 2>&1 ; }



function say_()
{
# Saironiq's bash script
# Usage: say_ en lol # says "lol" in english ; somecommand | say_ fr - # read text to say from a pipe
# requires madplay: sudo apt-get install madplay
lang=$1
shift
if [ "$1" = "-" ]
then
  read text
  echo $text
else
  text=$*
fi
len=`expr length "$text"`
if [ -z "$text" ] ; then
        echo "Please specify string to translate (up to 100 characters incl.)."
        exit 4
elif [ "$len" -gt "100" ] ; then
        echo "Can't translate more than 100 characters at once! (entered $len)"
        exit 2
fi
wget -qU Mozilla -O - "http://translate.google.com/translate_tts?tl=$lang&q=$text" | madplay -Q -o wave:- - | aplay -q -
}



###### translate a word using Google
# usage: translate <phrase> <output-language>
# example: translate "hello" es = hola (will auto-detect source language)
# for a list of language codes: http://en.wikipedia.org/wiki/List_of_ISO_639-1_codes
function translate() { wget -qO- "http://ajax.googleapis.com/ajax/services/language/translate?v=1.0&q=$1&langpair=%7C${2:-en}" | sed 's/.*{"translatedText":"\([^"]*\)".*/\1\n/'; }



function translate_help() {
cat <<EOF
Language	ISO
(Afan) Oromo	om
Abkhazian	ab
Afar		aa
Afrikaans	af
Albanian	sq
Amharic		am
Arabic		ar
Armenian	hy
Assamese	as
Aymara		ay
Azerbaijani	az
Bashkir		ba
Basque		eu
Bengali		bn
Bhutani		dz
Bihari		bh
Bislama		bi
Breton		br
Bulgarian	bg
Burmese		my
Byelorussian	be
Cambodian	km
Catalan		ca
Chinese		zh
Corsican	co
Croatian	hr
Czech		cs
Danish		da
Dutch		nl
English		en
Esperanto	eo
Estonian	et
Faeroese	fo
Fiji		fj
Finnish		fi
French		fr
Frisian		fy
Galician	gl
Georgian	ka
German		de
Greek		el
Greenlandic	kl
Guarani		gn
Gujarati	gu
Hausa		ha
Hebrew 		he
(former iw)
Hindi		hi
Hungarian	hu
Icelandic	is
Indonesian 	id
(former in)
Interlingua	ia
Interlingue	ie
Inupiak		ik
Inuktitut 	iu
(Eskimo)
Irish		ga
Italian		it
Japanese	ja
Javanese	jw
Kannada		kn
Kashmiri	ks
Kazakh		kk
Kinyarwanda	rw
Kirghiz		ky
Kirundi		rn
Korean		ko
Kurdish		ku
Laothian	lo
Latin		la
Latvian, 	lv
Lettish
Lingala		ln
Lithuanian	lt
Macedonian	mk
Malagasy	mg
Malay		ms
Malayalam	ml
Maltese		mt
Maori		mi
Marathi		mr
Moldavian	mo
Mongolian	mn
Nauru		na
Nepali		ne
Norwegian	no
Occitan		oc
Oriya		or
Pashto, Pushto	ps
Persian		fa
Polish		pl
Portuguese	pt
Punjabi		pa
Quechua		qu
Rhaeto-Romance	rm
Romanian	ro
Russian		ru
Samoan		sm
Sangro		sg
Sanskrit	sa
Scots Gaelic	gd
Serbian		sr
Serbo-Croatian	sh
Sesotho		st
Setswana	tn
Shona		sn
Sindhi		sd
Singhalese	si
Siswati		ss
Slovak		sk
Slovenian	sl
Somali		so
Spanish		es
Sudanese	su
Swahili		sw
Swedish		sv
Tagalog		tl
Tajik		tg
Tamil		ta
Tatar		tt
Tegulu		te
Thai		th
Tibetan		bo
Tigrinya	ti
Tonga		to
Tsonga		ts
Turkish		tr
Turkmen		tk
Twi		tw
Uigur		ug
Ukrainian	uk
Urdu		ur
Uzbek		uz
Vietnamese	vi
Volapuk		vo
Welch		cy
Wolof		wo
Xhosa		xh
Yiddish 	yi
(former ji)
Yoruba		yo
Zhuang		za
Zulu		zu
EOF
}



##################################################
# Super stealth background launch		 #
##################################################

function daemon()
{
    (exec "$@" >&/dev/null &)
}



##################################################
# Shows what processes need to be restarted after#
# system upgrade				 #
##################################################

function deadlib() { lsof | grep 'DEL.*lib' | cut -f 1 -d ' ' | sort -u; }



##################################################
# Show dead links				 #
##################################################

function deadlink() {
	# copyright 2007 - 2010 Christopher Bratusek
	find -L -type l
}


##################################################
# Download a web page and show info on what	 #
# took time					 #
##################################################

function debug_http() { /usr/bin/curl $@ -o /dev/null -w "dns: %{time_namelookup} connect: %{time_connect} pretransfer: %{time_pretransfer} starttransfer: %{time_starttransfer} total: %{time_total}\n" ; }


##################################################
# Delete function				 #
##################################################

function del()
{
    mv "$@" "/${HOME}/.local/share/Trash/files/"
}



function delete() {
    DIR=$1
    shift
    for i in $*; do
        if [ -f $DIR/$i ]; then
            rm $DIR/$i
        fi
    done
}



##################################################
# Lookup a word with dict.org			 #
##################################################

###### define "whatever"
function dic() { curl dict://dict.org/d:"$@" ; }



###### find matches of $1, with optional strat $2 and optional db $3
function ref()
{
    if [[ -z $3 ]]; then
        curl dict://dict.org/m:${1}:english:${2};
    else
        curl dict://dict.org/m:${1}:${3}:${2};
    fi
}


##################################################
# Diffs two xml files by formatting them first 	 #
# using xmllint and then invoking diff		 #
##################################################

###### usage: diffxml XMLFile1 XMLFile2
function diffxml() { diff -wb <(xmllint --format "$1") <(xmllint --format "$2"); }



##################################################
# Dirsize - finds directory sizes and lists	 #
# them for the current directory		 #
##################################################

function dirsize()
{
du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
egrep '^ *[0-9.]*M' /tmp/list
egrep '^ *[0-9.]*G' /tmp/list
rm /tmp/list
}



##################################################
# Display off (Turns the display off)		 #
##################################################

###### turns the display off and will stay off until any key/cursor is touched
# Display off with login (Turns the display off)
function display-oft()
{
cat > "/tmp/display-oft.py" <<"End-of-message"
#!/usr/bin/python
import time
import subprocess
from Xlib import X
from Xlib.display import Display
display = Display(':0')
root = display.screen().root
root.grab_pointer(True,
        X.ButtonPressMask | X.ButtonReleaseMask | X.PointerMotionMask,
        X.GrabModeAsync, X.GrabModeAsync, 0, 0, X.CurrentTime)
root.grab_keyboard(True,
        X.GrabModeAsync, X.GrabModeAsync, X.CurrentTime)
subprocess.call('xset dpms force off'.split())
p = subprocess.Popen('gnome-screensaver-command -i'.split())
time.sleep(1)
while True:
    print display.next_event()
    p.terminate()
    subprocess.Popen('gnome-screensaver-command -l'.split())
    break
End-of-message
chmod +x "/tmp/display-oft.py"
"/tmp/display-oft.py"
/bin/rm "/tmp/display-oft.py"
}



##################################################
# Change to specified pkg's documentation dir and#
# display the files				 #
##################################################

###### Usage: doc
function doc() {
    pushd "/usr/share/doc/$1" && ls
}



##################################################
# Lists unique IPs currently connected to 	 #
# logged-in system & how many concurrent 	 #
# connections each IP has			 #
##################################################

function doscheck()
{
"netstat -ntu | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n"
}



##################################################
# Symlinks all hidden files in a directory to the#
# same names without the dot			 #
##################################################

function dot_ln()
{
    for file in `/bin/ls -a | /bin/egrep "^\.[^./]"` ; do
        if [[ "$1" == "-f" ]] ; then
            /bin/ln -svif $file ${file:1}
        else
            /bin/ln -svi $file ${file:1}
        fi
    done
}



##################################################
# Site down for everyone or just me?		 #
##################################################

function downforme() {
	RED='\e[1;31m'
	GREEN='\e[1;32m'
	YELLOW='\e[1;33m'
	NC='\e[0m'
	if [ $# = 0 ]
	then
		echo -e "${YELLOW}usage:${NC} downforme website_url"
	else
		JUSTYOUARRAY=(`lynx -dump http://downforeveryoneorjustme.com/$1 | grep -o "It's just you"`)
		if [ ${#JUSTYOUARRAY} != 0 ]
		then
			echo -e "${RED}It's just you. \n${NC}$1 is up."
		else
			echo -e "${GREEN}It's not just you! \n${NC}$1 looks down from here."
		fi
	fi
}



##################################################
# Size of directories in MB			 #
##################################################

function ds()
{
    echo "size of directories in MB"
    if [ $# -lt 1 ] || [ $# -gt 2 ]; then
        echo "you did not specify a directy, using pwd"
        DIR=$(pwd)
        find $DIR -maxdepth 1 -type d -exec du -sm \{\} \; | sort -nr
    else
        find $1 -maxdepth 1 -type d -exec du -sm \{\} \; | sort -nr
    fi
}



##################################################
# Size of items in directory			 #
##################################################

function dubigf() {
  du -sh * | awk '/[[:space:]]*[[:digit:]]+,*[[:digit:]]*G/' | sort -nr
  du -sh * | awk '/[[:space:]]*[[:digit:]]+,*[[:digit:]]*M/' | sort -nr
}



##################################################
# Surround lines with quotes (useful in pipes)	 #
# - from mervTormel				 #
##################################################

function enquote() { /usr/bin/sed 's/^/"/;s/$/"/' ; }



##################################################
# Determining the meaning of error codes	 #
##################################################

function err()
{
    grep --recursive --color=auto --recursive -- "$@" /usr/include/*/errno.h
    if [ "${?}" != 0 ]; then
        echo "Not found."
    fi
}

##################################################
# URLs ...					 #
##################################################

###### expand shortened URLs
function expandurl() { curl -sIL $1 2>&1 | awk '/^Location/ {print $2}' | tail -n1; }



###### short URLs with is.gd
function isgd() { /usr/bin/wget -qO - "http://is.gd/create.php?format=simple&url=$1" ;}



###### resolve short URLs
function resolve() { curl -Is $1 | sed -n 's/^Location: //p'; }



##################################################
# Extract - extract most common compression	 #
# types						 #
##################################################

function extract() {
  local e=0 i c
  for i; do
    if [[ -f $i && -r $i ]]; then
        c=''
        case $i in
          *.t@(gz|lz|xz|b@(2|z?(2))|a@(z|r?(.@(Z|bz?(2)|gz|lzma|xz)))))
                 c='bsdtar xvf' ;;
          *.7z)  c='7z x'       ;;
          *.Z)   c='uncompress' ;;
          *.bz2) c='bunzip2'    ;;
          *.exe) c='cabextract' ;;
          *.gz)  c='gunzip'     ;;
          *.rar) c='unrar x'    ;;
          *.xz)  c='unxz'       ;;
          *.zip) c='unzip'      ;;
          *)     echo "$0: cannot extract \`$i': Unrecognized file extension" >&2; e=1 ;;
        esac
        [[ $c ]] && command $c "$i"
    else
        echo "$0: cannot extract \`$i': File is unreadable" >&2; e=2
    fi
  done
  return $e
}



##################################################
# CIA world fact book				 #
##################################################

function fact() {
    dict -d world02 $@
}



##################################################
# Passwording					 #
##################################################

###### fake name and pass
function fakepass()
{
  local l=8
  [ -n "$1" ] && l=$1
  dd if=/dev/urandom count=1 2> /dev/null | uuencode -m - | head -n 2 | tail -n 1 | cut -c $l
}



alias fakename='nc koeln.ccc.de 23 | cut -d \  -f 4,5'



###### password file
function pw()
{
    if [ "$OS" = "Linux" ]; then
        gpg $HOME/priv.asc
        vi -n $HOME/priv
        gpg -ea $HOME/priv
        wipe -f $HOME/priv
    elif [ "$OS" = "Darwin" ]; then
        gpg $HOME/Documents/priv.asc
        vi -n $HOME/Documents/priv
        gpg -ea $HOME/Documents/priv
        srm -f $HOME/Documents/priv
    fi
}



###### generate a random password
#   $1 = number of characters; defaults to 32
#   $2 = include special characters; 1 = yes, 0 = no; defaults to 1
# copyright 2007 - 2010 Christopher Bratusek
function randompw() {
	if [[ $2 == "!" ]]; then
		echo $(cat /dev/urandom | tr -cd '[:graph:]' | head -c ${1:-32})
	else	echo $(cat /dev/urandom | tr -cd '[:alnum:]' | head -c ${1:-32})
	fi
}



###### generate a random left-hand password
alias randompwl='</dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c8; echo ""'



###### generate a unique and secure password for every website that you login to
function sitepass() { echo -n "$@" |  md5sum | sha1sum | sha224sum | sha256sum | sha384sum | sha512sum | gzip - | strings -n 1 | tr -d "[:space:]"  | tr -s '[:print:]' | tr '!-~' 'P-~!-O' | rev | cut -b 2-11; history -d $(($HISTCMD-1)); }



###### generates a unique and secure password with SALT for every website that you login to
function sitepass2()
{
salt="this_salt";pass=`echo -n "$@"`;for i in {1..500};do pass=`echo -n $pass$salt|sha512sum`;done;echo$pass|gzip -|strings -n 1|tr -d "[:space:]"|tr -s '[:print:]' |tr '!-~' 'P-~!-O'|rev|cut -b 2-15;history -d $(($HISTCMD-1));
}



###### trunc	password
function trunc_pwd()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*help )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}trunc_pwd ${ewhite}|${egreen} ! no options !\n"
			tput sgr0
		;;
		* )
			pwdmaxlen=$(get_key pwdmaxlength)
			trunc_symbol=$(get_key pwdchar)
			dirchar=$(get_key dirchar)
			newsepacolor=$(echo $sepacolor | sed -e 's/\\\[//g' -e 's/\\\]//g')
			newwdircolor=$(echo $wdircolor | sed -e 's/\\\[//g' -e 's/\\\]//g')
			newpscoloror=$(echo $pscolor | sed -e 's/\\\[//g' -e 's/\\\]//g')
			if [ ${#PWD} -gt $pwdmaxlen ]; then
				pwdoffset=$(( ${#PWD} - $pwdmaxlen ))
				if [[ $pstyle_supported == true ]]; then
					xPWD="$newpscoloror${trunc_symbol}${PWD:$pwdoffset:$pwdmaxlen}"
				else	xPWD="${trunc_symbol}${PWD:$pwdoffset:$pwdmaxlen}"
				fi
				if [[ $enabcol == true && $pstyle_supported == true ]]; then
					newPWD="${xPWD//\//$newsepacolor$dirchar$newwdircolor}"
				else	newPWD="${xPWD//\//$dirchar}"
				fi
			else
				if [[ $enabcol == true && $pstyle_supported == true ]]; then
				newPWD="${PWD//\//$newsepacolor$dirchar$newwdircolor}"
			else	newPWD="${PWD//\//$dirchar}"
			fi
			fi
			echo -e $newPWD
		;;
	esac
}



##################################################
# Find a file(s) ...				 #
##################################################

###### ... with pattern $1 in name and Execute $2 on it
function fe() { find . -type f -iname '*'$1'*' -exec "${2:-file}" {} \;  ; }



###### ... under the current directory
function ff() { /usr/bin/find . -name "$@" ; }



###### ... whose name ends with a given string
function ffe() { /usr/bin/find . -name '*'"$@" ; }



###### ... fast find (by filename; uses sh, less and sed)
function ffind() { local a=$1; local b=$2; local c="$a"*/*"$b"*; case $# in [01])echo usage: ff drive string [match-no\(s\)];; 2)printf "%s\n" $c|less -SN;; 3)less $(printf "%s\n" $c|sed -n "$3"p|tr '\n' ' ');; esac; }



###### ... whose name starts with a given string
function ffs() { /usr/bin/find . -name "$@"'*' ; }



###### ... larger than a certain size (in bytes)
function find_larger() { find . -type f -size +${1}c ; }



###### find a file with a pattern in name in the local directory
function fp()
{
    find . -type f -iname '*'$*'*' -ls ;
}



###### find pattern in a set of files and highlight them
function fstr()
{
    OPTIND=1
    local case=""
    local usage="fstr: find string in files.
Usage: fstr [-i] \"pattern\" [\"filename pattern\"] "
    while getopts :it opt
    do
        case "$opt" in
        i) case="-i " ;;
        *) echo "$usage"; return;;
        esac
    done
    shift $(( $OPTIND - 1 ))
    if [ "$#" -lt 1 ]; then
        echo "$usage"
        return;
    fi
    local SMSO=$(tput smso)
    local RMSO=$(tput rmso)
    find . -type f -name "${2:-*}" -print0 | xargs -0 grep -sn ${case} "$1" 2>&- | \
sed "s/$1/${SMSO}\0${RMSO}/gI" | more
}



###### searches through the text of all the files in your current directory
# http://seanp2k.com/?p=13
# Good for debugging a PHP script you didn't write and can't trackdown where MySQL connect string actually is
# function grip() {
# grep -ir "$1″ "$PWD"
# }



###### ... who is the newest file in a directory
function newest() { find ${1:-\.} -type f |xargs ls -lrt ; }



##################################################
# Find in file and ( AND relation )		 #
##################################################

# Will search PWD for text files that contain $1 AND $2 AND $3 etc...
# Actually it does the same as grep word1|grep word2|grep word3 etc, but in a more elegant way.
function ffa() { (($# < 2)) && { echo "usage: ffa pat1 pat2 [...]" >&2; return 1; };awk "/$1/$(printf "&&/%s/" "${@:2}")"'{ print FILENAME ":" $0 }' *; }



##################################################
# Alternative for basename using grep to extract #
# file name					 #
##################################################

###### eg: fileName /path/to/file.ext
function fileName()  { echo "$1"  | grep -o "[^/]*$"; }



##################################################
# Extract extention of a file			 #
##################################################

function filext() { echo ${1##*.}; }



##################################################
# Find out the pid of a specified process	 #
##################################################

######  note that the command name can be specified via a regex
#    E.g. findPid '/d$/' finds pids of all processes with names ending in 'd'
#    Without the 'sudo' it will only find processes of the current user
function findPid() { sudo /usr/sbin/lsof -t -c "$@" ; }


##################################################
# Recursively fix dir/file permissions on a	 #
# given directory				 #
##################################################

function fix() {
if [ -d $1 ]; then
find $1 -type d -exec chmod 755 {} \;
find $1 -type f -exec chmod 644 {} \;
else
echo "$1 is not a directory."
fi
}



##################################################
# Edit files in place to ensure Unix line-	 #
# endings					 #
##################################################

function fixlines() { /usr/bin/perl -pi~ -e 's/\r\n?/\n/g' "$@" ; }



##################################################
# Fix eclipse mistakes with tabs		 #
##################################################

###### Sources files should never use TABs for indenting because they may looks different in different editors
# For example there popular Eclipse IDE use a the non default tab size 4
function fix-tabs() { expand -t 4 "$1" > "$1.expanded"; mv -f "$1.expanded" "$1"; }



##################################################
# Inserts a flag with the specified content	 #
##################################################

###### Usage: flag "comment"
# If no comment, inserts the date.
function flag() {
    if [ "$1" == "" ];
    then
        echo -e  "\e[0;31m[====== " `date +"%A %e %B %Y"`, `date +"%H"`h`date +"%M"` " ======]\e[0m"
    else
        echo -e  "\e[0;31m[====== " $@ " ======]\e[0m"
    fi
}



##################################################
# Inserts a flag and executes the command	 #
##################################################

###### Example: flagcommand ls
function flagcommand() {
    if [ "$1" == "" ];
    then
        return
    else
        flag $@
        $@
    fi
}



##################################################
# Weather and stuff				 #
##################################################

###### 10-day forcast
# USAGE:	forecast 50315
function forecast() {
_ZIP=$1

if   [ $# = 1 ];then
     printf "$_ZIP\n" | egrep '^[0-9][0-9][0-9][0-9][0-9]$' >>/dev/null
     if   [ $? = 0 ];then
          printf "Your 10 Day Weather Forecast as follows:\n";
          lynx -dump "http://www.weather.com/weather/print/$_ZIP" | sed -n '/%$/s/\[.*\]//p';
          printf "\n"
     elif [ $? = 1 ];then
          printf "Bad ZIP code!\n"
     fi
elif [ $# != 1 ];then
     printf "You need to supply a ZIP code!\n"
fi
}



###### get sunrise and sunset times
function suntimes()
{
l=12765843;curl -s http://weather.yahooapis.com/forecastrss?w=$l|grep astronomy| awk -F\" '{print $2 "\n" $4;}'
}



##################################################
# Find all bash functions in a file		 #
##################################################

###### finds all functions defined in any shell script secified, including .bashrc
function functions() { read -p "File name> "; sort -d $REPLY | grep "() {" | sed -e 's/() {//g' | less; }



##################################################
# ISO-maker from disc				 #
##################################################

function geniso() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $CD_WRITER ]]; then
		dd $DD_OPTS if=$CD_WRITER of="$1"
	else	dd $DD_OPTS if=/dev/dvdrw of="$1"
	fi
}


##################################################
# Get duration of an audio file in seconds.	 #
##################################################

function get_duration() { durline=$(sox "$1" -n stat 2>&1|grep "Length (seconds):");echo ${durline#*\: }; }


##################################################
# Get just the HTTP headers from a web page	 #
# (and its redirects)				 #
##################################################

function http_headers() { /usr/bin/curl -I -L $@ ; }



##################################################
# Convert number of bytes to human readable 	 #
# filesize					 #
##################################################

function human_filesize() { awk -v sum="$1" ' BEGIN {hum[1024^3]="Gb"; hum[1024^2]="Mb"; hum[1024]="Kb"; for (x=1024^3; x>=1024; x/=1024) { if (sum>=x) { printf "%.2f %s\n",sum/x,hum[x]; break; } } if (sum<1024) print "1kb"; } ' ; }


###### notify on Battery power
# works on laptops, desktop having communication b/w UPS & CPU
function NotifyOnBATTERY() { while :; do on_ac_power||notify-send "Running on BATTERY"; sleep 1m; done ; }



###### colored status of running services
function services() { printf "$(service --status-all 2>&1|sed -e 's/\[ + \]/\\E\[42m\[ + \]\\E\[0m/g' -e 's/\[ - \]/\\E\[41m\[ - \]\\E\[0m/g' -e 's/\[ ? \]/\\E\[43m\[ ? \]\\E\[0m/g')\n"; }



function show_battery_load()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*acpi )
			check_opt acpi show_battery_load::acpi
			if [[ $? != "1" ]]; then
				load=$(acpi -b | sed -e "s/.* \([1-9][0-9]*\)%.*/\1/")
				out="$(acpi -b)"
				state="$(echo "${out}" | awk '{print $3}')"
				case ${state} in
					charging,)
						statesign="^"
					;;
					discharging,)
						statesign="v"
					;;
					charged,)
						statesign="°"
					;;
				esac
				battery="${statesign}${load}"
				echo $battery
			fi
		;;
		*apm )
			check_opt apm show_battery_load::apm
			if [[ $? != "1" ]]; then
				result="$(apm)"
				case ${result} in
					*'AC on'*)
						state="^"
					;;
					*'AC off'*)
						state="v"
					;;
				esac
				load="${temp##* }"
				battery="${state}${load}"
				echo $battery
			fi
		;;
		* )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_battery_load${ewhite} |${egreen} --acpi${eiceblue} [show batteryload using acpi]\
			\n${eorange}show_battery_load${ewhite} |${egreen} --apm${eiceblue} [show batteryload using apm]" | column -t
			echo ""
			tput sgr0
		;;
	esac
}

function show_size()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*help )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_size ${ewhite}|${egreen} ! no options !\n"
			tput sgr0
		;;
		* )
			let TotalBytes=0
			for Bytes in $(ls -lA -1 | grep "^-" | awk '{ print $5 }'); do
				let TotalBytes=$TotalBytes+$Bytes
			done
			if [ $TotalBytes -lt 1024 ]; then
				TotalSize=$(echo -e "scale=1 \n$TotalBytes \nquit" | bc)
				suffix="B"
			elif [ $TotalBytes -lt 1048576 ]; then
				TotalSize=$(echo -e "scale=1 \n$TotalBytes/1024 \nquit" | bc)
				suffix="KB"
			elif [ $TotalBytes -lt 1073741824 ]; then
				TotalSize=$(echo -e "scale=1 \n$TotalBytes/1048576 \nquit" | bc)
				suffix="MB"
			else
				TotalSize=$(echo -e "scale=1 \n$TotalBytes/1073741824 \nquit" | bc)
				suffix="GB"
			fi
			echo "${TotalSize} ${suffix}"
		;;
	esac
}



function show_space()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*used-percent )
			echo $(df | grep -w $2 | gawk '{print $5}')
		;;
		*free-percent )
			echo $((100-$(df | grep -w $2 | gawk '{print $5}' | sed -e 's/\%//g')))%
		;;
		*used )
			echo $(df -h | grep -w $2 | gawk '{print $3}')B
		;;
		*free )
			echo $(df -h | grep -w $2 | gawk '{print $4}')B
		;;
		*total )
			echo $(df -h | grep -w $2 | gawk '{print $2}')B
		;;
		* )
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}show_space ${ewhite}|${egreen} --used ${eiceblue}[display used space in mb/gb]\
			\n${eorange}show_space ${ewhite}|${egreen} --free ${eiceblue}[display free space in mb/gb]\
			\n${eorange}show_space ${ewhite}|${egreen} --percent-used ${eiceblue}[display used space in %]\
			\n${eorange}show_space ${ewhite}|${egreen} --percent-free ${eiceblue}[display free space in %]" | column -t
			echo ""
			tput sgr0
		;;
	esac
}



###### STAT Function showing ALL info, stat options, and descriptions
function statt() { C=c;stat --h|sed '/Th/,/NO/!d;/%/!d'|while read l;do p=${l/% */};[ $p == %Z ]&&C=fc&&echo ^FS:^;echo "`stat -$C $p \"$1\"` ^$p^${l#%* }";done|column -ts^; }



function system_infos()
# copyright 2007 - 2010 Christopher Bratusek
{
	case $1 in
		*cpu)
			echo -e "${ewhite}CPU:\n"
			echo -e "${eorange}Model:${eiceblue} $(grep "model name" /proc/cpuinfo | sed -e 's/.*: //g')"
			echo -e "${eorange}MHz  :${eiceblue} $(grep "cpu MHz" /proc/cpuinfo | sed -e 's/.*: //g')\n"
		;;
		*kernel)
			echo -e "${ewhite}Kernel:\n"
			echo -e "${eorange}Release:${eiceblue} $(uname -r)"
			echo -e "${eorange}Version:${eiceblue} $(uname -v)"
			echo -e "${eorange}Machine:${eiceblue} $(uname -m)\n"
		;;
		*mem | *ram)
			echo -e "${ewhite}RAM:\n"
			echo -e "${eorange}Total:${eiceblue} $(((`showmem --free`) + (`showmem --used`))) MB"
			echo -e "${eorange}Free :${eiceblue} $(showmem --free) MB"
			echo -e "${eorange}Used :${eiceblue} $(showmem --used) MB\n"
		;;
		*partitions)
			echo -e "${ewhite}Partitions:${eorange}\n"
			echo -e "major minor blocks device-node ${eiceblue}\
			\n$(cat /proc/partitions | sed -e '1,2d')" | column -t
			echo ""
		;;
		*pci)
			check_opt lspci systeminfos::pci
			if [[ $? != "1" ]]; then
				echo -e "${ewhite}PCI Devices:\n${eiceblue}"
				lspci -vkmm
				echo ""
			fi
		;;
		*usb)
			check_opt lsusb systeminfos::usb
			if [[ $? != "1" ]]; then
				echo -e "${ewhite}USB Devices:\n${eiceblue}"
				lsusb -v
				echo ""
			fi
		;;
		*mounts)
			echo -e "${ewhite}Mounts:\n${eorange}\
			\ndevice-node on mount-point type filesystem options\n" ${eiceblue} "\n\n$(mount)" | column -t
			echo ""
		;;
		*bios)
			check_opt dmidecode systeminfos::bios
			if [[ $? != "1" && $EUID == 0 ]]; then
				echo -e "${ewhite}SMBIOS/DMI Infos:${eiceblue}\n"
				dmidecode -q
			fi
		;;
		*all)
			system_infos_cpu
			system_infos_kernel
			system_infos_memory
			system_infos_partitions
			# system_infos_pci
			# system_infos_usb
			system_infos_mounts
			# system_infos_bios
		;;
		*)
			echo -e "\n${ewhite}Usage:\n"
			echo -e "${eorange}system_infos ${ewhite}|${egreen} --cpu\t\t${eiceblue}[Display CPU Model and Freq]\
			\n${eorange}system_infos ${ewhite}|${egreen} --kernel\t${eiceblue} 	[Display Kernel Version, Release and Machine]\
			\n${eorange}system_infos ${ewhite}|${egreen} --memory\t${eiceblue} 	[Display Total, Free and Used RAM]\
			\n${eorange}system_infos ${ewhite}|${egreen} --partitions\t${eiceblue}[Display Major, Minor, Blocks and Node for all Paritions]\
			\n${eorange}system_infos ${ewhite}|${egreen} --pci\t\t${eiceblue}[Display Infos about all PCI Devices (and their kernel-module)]\
			\n${eorange}system_infos ${ewhite}|${egreen} --usb\t\t${eiceblue}[Display Infos about all USB Devices (and their kernel-module)]\
			\n${eorange}system_infos ${ewhite}|${egreen} --bios\t${eiceblue} 	[Display SMBIOS DMI Infos]\
			\n${eorange}system_infos ${ewhite}|${egreen} --mounts\t${eiceblue} 	[Display all mounted devices]\n"
			tput sgr0
		;;
	esac
}


##################################################
# Search IMDB.COM				 #
##################################################

function imdb()
{
firefox "http://www.imdb.com/find?s=all&q="${@}"&x=0&y=0" &
}



##################################################
# Using PIPEs, Execute a command, convert output #
# to .png file, upload file to imgur.com, then 	 #
# returning the address of the .png.		 #
##################################################

function imgur() { convert label:@- png:-|curl -F "image=@-" -F "key=1913b4ac473c692372d108209958fd15" http://api.imgur.com/2/upload.xml|grep -E -o "<original>(.)*</original>" | grep -E -o "http://i.imgur.com/[^<]*" ; }


##################################################
# Displays metadata for specified media file	 #
##################################################

######   $1 = media file name
function info() {
    EXT=`echo "${1##*.}" | sed 's/\(.*\)/\L\1/'`
    if [ "$EXT" == "mp3" ]; then
        id3v2 -l "$1"
        echo
        mp3gain -s c "$1"
    elif [ "$EXT" == "flac" ]; then
        metaflac --list --block-type=STREAMINFO,VORBIS_COMMENT "$1"
    else
        echo "ERROR: Not a supported file type."
    fi
}


##################################################
# Check variable has been set			 #
##################################################

###### works in all shells
# does not require a test
# handles like an assertion
function isdef() { eval test -n \"\${$1+1}\"; }



##################################################
# Jump to any directory...			 #
##################################################

###### ..below the current one
# usage: jd dir
# requires globstar. To set globstar use: shopt -s globstar
function jtb() { cd **/"$@"; }



###### ..above the current one
function jta() { cd $(pwd | sed "s/\(\/$@\/\).*/\1/g"); }



###### usage: upto directory
function upto() { cd "${PWD/\/$@\/*//$@}"; }



##################################################
# Kill a process by name			 #
##################################################

###### example: pskill firefox-bin
# copyright 2007 - 2010 Christopher Bratusek
function psgrep() {
	if [[ $1 == "-u" ]]; then
		ps aux | grep -v grep | grep $2 | awk '{ print $2 " : " $11}' | tee .temp
		CMDS=$(cat .temp)
	elif [[ $1 != "" ]]; then
		ps aux | grep -v grep | grep "$1" | awk '{ print $11 " : " $2 " : " $1 }' | tee .temp
		CMDS=$(cat .temp)
	fi
	if [[ $CMDS == "" ]]; then
		echo "no matching process"
	fi
	rm -f .temp
}



function pskill() {
	if [[ $1 ]]; then
		psgrep $1
		shift
		if [[ $CMDS != "" ]]; then
			echo -e "\nenter process number to kill:\n"
			read ID
			if [[ ! $ID == 0 || ! $ID == "" ]]; then
				kill $@ $ID
			fi
		fi
	fi
}



##################################################
# Advanced ls functions				 #
##################################################

function la() {
	# copyright 2007 - 2010 Christopher Bratusek
	ls -A --group-directories-first "$@"
}



function lg() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ "$@" == "" ]]; then
		$@="*"
	fi
	ls -l --group-directories-first "$@" | gawk '{print $9, "belongs to Group ->", $4}' | column -t
}



function ll() {
	# copyright 2007 - 2010 Christopher Bratusek
	ls -l --group-directories-first "$@"
}



###### Counts files, subdirectories and directory size and displays details
# about files depending on the available space
function lls() {
	# count files
	echo -n "<`find . -maxdepth 1 -mindepth 1 -type f | wc -l | tr -d '[:space:]'` files>"
	# count sub-directories
	echo -n " <`find . -maxdepth 1 -mindepth 1 -type d | wc -l | tr -d '[:space:]'` dirs/>"
	# count links
	echo -n " <`find . -maxdepth 1 -mindepth 1 -type l | wc -l | tr -d '[:space:]'` links@>"
	# total disk space used by this directory and all subdirectories
	echo " <~`du -sh . 2> /dev/null | cut -f1`>"
	ROWS=`stty size | cut -d' ' -f1`
	FILES=`find . -maxdepth 1 -mindepth 1 |
	wc -l | tr -d '[:space:]'`
	# if the terminal has enough lines, do a long listing
	if [ `expr "${ROWS}" - 6` -lt "${FILES}" ]; then
		ls
	else
		ls -hlAF --full-time
	fi
}



function lo() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ "$@" == "" ]]; then
		$@="*"
	fi
	ls -l --group-directories-first "$@" | gawk '{print $9, "belongs to User ->", $3}' | sed -e '1d' | column -t
}



function l1() {
	# copyright 2007 - 2010 Christopher Bratusek
	ls -1 --group-directories-first "$@"
}




function lm() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ ! "$@" == "" ]]; then
		for file in "$@"; do
			stat -c "%A %a %n" "$file" | gawk '{print "Permissions of:", $3, "->", $1, "("$2")"}'
		done | column -t
	fi
}



###### inspired by http://tldp.org/HOWTO/Bash-Prompt-HOWTO/x279.html
# but I made it a single awk instead of an awk, forloop and a bc
# asumes we have awk available.  but really, who doesnt have awk?
# let's get the size of the files in this dir
function lsbytes() {
    echo -n $(ls -l | awk '/^-/{total += $5} END{printf "%.2f", total/1048576}')
}



function lscd() {
	# copyright 2007 - 2010 Christopher Bratusek
	builtin cd "${@}" &>/dev/null
	. $BSNG_RC_DIR/dirinfo/display
	dirinfo_display
	echo -e "${epink}content:"
	ls $LSCD_OPTS
	echo "$PWD" > $HOME/.lastpwd
}



###### display long list of files with the given extension
# example: lsext txt
function lsext()
{
find . -type f -iname '*.'${1}'' -exec ls -l {} \; ;
}



###### another way to call for a list of files/folders
function lsr() { /bin/ls -l "$@"/..namedfork/rsrc ; }



###### sorted, recursive long file listing
function lsr_() { find "${@:-.}" -print0 |sort -z |xargs -0 ls $LS_OPTIONS -dla; }


##################################################
# Corporate ldapsearch for users		 #
##################################################

function ldapfind() {
        ldapsearch -x -h ldap.foo.bar.com -b dc=bar,dc=com uid=$1
}



##################################################
# Organize a text file				 #
##################################################

###### sort lines in a text file
function linesort()
{
sort -u "$1" > "$1".new
}



###### remove duplicate lines in a file (without resorting)
function removeduplines()
{
awk '!x[$0]++' "$1" > "$1".new
}


##################################################
# List your MACs address			 #
##################################################

function lsmac() { ifconfig -a | awk '/HWaddr/ {print $5}' ; }



##################################################
# MPD music stuff				 #
##################################################

###### Add music files in MPD
function madd()
{
    # while [ $# -gt 0 ]; do
        # case "$1" in
            # a)
            # args[i++]=artist;;
            # b)
            # args[i++]=album;;
            # t)
            # args[i++]=title;;
            # *)
            # args[i++]=$1;;
        # esac; shift;
    # done
    # mpc search "${args[@]}" |
    mpc search "$@" |
    mpc add
}



###### Clear, add and play: MPD
function mcap()
{
    mpc clear
    # while [ $# -gt 0 ]; do
        # case "$1" in
            # a)
            # args[i++]=artist;;
            # b)
            # args[i++]=album;;
            # t)
            # args[i++]=title;;
            # *)
            # args[i++]=$1;;
        # esac; shift; done
    # mpc search "${args[@]}" |
    mpc search "$@" |
    mpc add
    mpc play
}



##################################################
# Extended man command 				 #
##################################################

###### requires: sudo apt-get install w3m
function man_ext()
{
/usr/bin/man $* || w3m -dump http://google.com/search?q="$*"\&btnI | less
}



##################################################
# Manpage to ... document			 #
##################################################

###### example:	man2pdf wipe	=	wipe.pdf
# copyright 2007 - 2010 Christopher Bratusek
function man2pdf()
{
	case $1 in
		*help | "" )
			echo -e "\nUsage:"
			echo -e	"\nman2pdf | <manualpage> [generate a pdf from <manualpage>]\n"
			tput sgr0
		;;
		* )
			check_opt ps2pdf man2pdf
			if [[ $? != "1"  && $1 ]]; then
				man -t $1 | ps2pdf - >$1.pdf
			else	echo "No manpage given."
			fi
		;;
	esac
}



###### example:	man2text wipe	=	wipe.txt
function man2text()
{
man "$1" | col -b > ~/man_"$1".txt
}

##################################################
# Makes directory then moves into it		 #
##################################################

function mkcdr() {
    mkdir -p -v $1
    cd $1
}



function mkdircd()	{ mkdir -p "$@" && eval cd "\"\$$#\""; }



##################################################
# Creates an archive from directory		 #
##################################################

function mktar() { tar cvf  "${1%%/}.tar"     "${1%%/}/"; }



function mktbz() { tar cvjf "${1%%/}.tar.bz2" "${1%%/}/"; }



function mktgz() { tar cvzf "${1%%/}.tar.gz"  "${1%%/}/"; }


##################################################
# Morse code encoding and decoding		 #
##################################################

###### this is a short Morse code decoder written as a shellscript using sed
# the Morse coded text should be written with spaces between the letters
# only good to convert from Morse code to text
# by scvalex
function morse2text()
{
echo $1\  | tr . 0 | sed -e {s/0----\ /1/g} -e {s/00---\ /2/g} -e {s/000--\ /3/g} -e {s/000-\ /4/g} -e {s/00000\ /5/g} -e {s/-0000\ /6/g} -e {s/--000\ /7/g} -e {s/---00\ /8/g} -e {s/----0\ /9/g} -e {s/-----\ /0/g} \
	| sed -e {s/-0-0\ /c/g} -e {s/-000\ /b/g} -e {s/00-0\ /f/g} -e {s/0000\ /h/g} -e {s/0---\ /j/g} -e {s/0-00\ /l/g} -e {s/0--0\ /p/g} -e {s/--0-\ /q/g} -e {s/000-\ /v/g} -e {s/-00-\ /x/g} -e {s/-0--\ /y/g} -e {s/--00\ /z/g} \
	| sed -e {s/0--\ /w/g} -e {s/-00\ /d/g} -e {s/--0\ /g/g} -e {s/-0-\ /k/g} -e {s/---\ /o/g} -e {s/0-0\ /r/g} -e {s/000\ /s/g} -e {s/00-\ /u/g} \
	| sed -e {s/0-\ /a/g} -e {s/00\ /i/g} -e {s/--\ /m/g} -e {s/-0\ /n/g} \
	| sed -e {s/0\ /e/g} -e {s/-\ /t/g}
}



function text2morse()
{
cat > "/tmp/text2morse.py" <<"End-of-message"
#!/usr/bin/python
# short mark, dot or 'dit' (.) = .
# longer mark, dash or 'dah' (-) = -
# intra-character gap (between the dots and dashes within a character) = no space
# short gap (between letters) = single space
# medium gap (between words) = double space
import sys
__author__="Aanand Natarajan"
# morse code dictionary
codes = {'1':".----",'2':"..---",'3':"...--",'4':"....-",'5':".....",'6':"-....",'7':"--...",'8':"---..",
'9':"----.",'0':"-----",'A':".-",'B':"-...",'C':"-.-.",'D':"-..",'E':".",'F':"..-.",'G':"--.",
'H':"....",'I':"..",'J':".---",'K':"-.-",'L':".-..",'M':"--",'N':"-.",'O':"---",'P':".--.",
'Q':"--.-",'R':".-.",'S':"...",'T':"-",'U':"..-",'V':"...-",'W':".--",'X':"-..-",'Y':"-.--",
'Z':"--..",
# punctuations
',':"--..--",'.':".-.-.-",'?':"..--..",';':"-.-.-",':':"---...",'/':"-..-.",
'-':"-....-","'":".----.",'(':"-.--.",')':"-.--.-",'!':"-.-.--",'&':".-...",
'=':"-...-",'+':".-.-.",'_':"..--.-",'"':".-..-.",'$':"...-..-",'@':".--.-.",
# space
' ':"|"}
binary = {'.':'.','-':'-',',':' ','|':'  '}
def encode(value):
    """ encodes the value into morse code """
    morse_value=""
    value.replace('*', 'X')
    value.replace('^', 'XX')
    for c in value:
       try :
               morse_value += codes[c.upper()]+','
       except :
         print "Unintended character " + c + " omitted"
    return _get_binary(morse_value)
def decode(morse_code_value):
    """ decodes the morse bytes """
    decoded_value = _decode_binary(morse_code_value)
    ascii_value=""
    for v in decoded_value.split(","):
        ascii_value += _get_key(v)
    return ascii_value
def _get_binary(value):
     binary_value = ""
     for c in value:
         binary_value += binary[c]
     return binary_value
def _get_key(value):
     """ returns the key for the given value """
     for k,v in codes.items():
         if v == value:
            return k
     return ''
def _decode_binary(binary):
    dah_replaced = binary.replace('-', '-')
    dit_replaced = dah_replaced.replace('.', '.')
    comma_replaced = dit_replaced.replace(' ', ',')
    zero_replaced = comma_replaced.replace('', '|,')
    return zero_replaced
def _do_decode(value):
    print "Decoded : "+decode(value)
def _do_encode(value):
    print "Encoded : "+encode(value)
if __name__ == "__main__":
   if len(sys.argv) > 2:
      if sys.argv[1] == 'd' :
         print "decoding"
         _do_decode(sys.argv[2])
      else:
         print "encoding"
         _do_encode(sys.argv[2])
   elif len(sys.argv) > 1:
        print "encoding"
        _do_encode(sys.argv[1])
   else:
        print "Usage : "+sys.argv[0]+" [d (decode) |e (encode)] [input string]"
End-of-message
chmod +x "/tmp/text2morse.py"
"/tmp/text2morse.py" "$1"
rm "/tmp/text2morse.py"
}


##################################################
# Mount Fat					 #
##################################################

function mount_fat()
{
    local _DEF_PATH="/media/tmp1"
    if [ -n "$2" ];then
        sudo mount -t vfat -o rw,users,flush,umask=0000 "$1" "$2"
    else
        sudo mount -t vfat -o rw,users,flush,umask=0000 "$1" $_DEF_PATH
    fi
}



##################################################
# Query Wikipedia via console over DNS		 #
##################################################

function mwiki() { blah=`echo $@ | sed -e 's/ /_/g'`; dig +short txt $blah.wp.dg.cx; }



# function mwiki() { dig +short txt `echo $*|sed 's| *|_|g'`.wp.dg.cx; }



function mwiki_() { local IFS=_; dig +short txt "${*^}".wp.dg.cx; }



##################################################
# Run command detached from terminal and without #
# output					 #
##################################################

###### Usage: nh
function nh() {
    nohup "$@" &>/dev/null &
}



##################################################
# Open a new terminal tab in the same directory  #
# as the current				 #
##################################################

###### SOURCE => http://pastie.caboo.se/188640
#    AND => http://justinfrench.com/index.php?id=231
function nth() {
  osascript -e "
  Tell application \"Terminal\"
    activate
    tell application \"System Events\" to tell process \"Terminal\" to keystroke \"t\" using command down
    do script with command \"cd '$(pwd)'; clear\" in selected tab of the front window
  end tell"
}




##################################################
# ThePirateBay.org torrent search		 #
##################################################

function piratebay()
{
lynx -dump http://thepiratebay.org/search/$@|awk '/TPB.torrent$/ {print $2}'
}



##################################################
# Optimize PNG files				 #
##################################################

function pngoptim()
{
       NAME_="pngoptim"
       HTML_="optimize png files"
    PURPOSE_="reduce the size of a PNG file if possible"
   SYNOPSIS_="$NAME_ [-hl] <file> [file...]"
   REQUIRES_="standard GNU commands, pngcrush"
    VERSION_="1.0"
       DATE_="2004-06-29; last update: 2004-12-30"
     AUTHOR_="Dawid Michalczyk <dm@eonworks.com>"
        URL_="www.comp.eonworks.com"
   CATEGORY_="gfx"
   PLATFORM_="Linux"
      SHELL_="bash"
 DISTRIBUTE_="yes"
# This program is distributed under the terms of the GNU General Public License
usage() {
echo >&2 "$NAME_ $VERSION_ - $PURPOSE_
Usage: $SYNOPSIS_
Requires: $REQUIRES_
Options:
     -h, usage and options (this help)
     -l, see this script"
exit 1
}
# tmp file set up
tmp_1=/tmp/tmp.${RANDOM}$$
# signal trapping and tmp file removal
trap 'rm -f $tmp_1 >/dev/null 2>&1' 0
trap "exit 1" 1 2 3 15
# var init
old_total=0
new_total=0
# arg handling and main execution
case "$1" in
    -h) usage ;;
    -l) more $0; exit 1 ;;
     *.*) # main execution
        # check if required command is in $PATH variable
        which pngcrush &> /dev/null
        [[ $? != 0 ]] && { echo >&2 required \"pngcrush\" command is not in your PATH; exit 1; }
        for a in "$@";do
            if [ -f $a ] && [[ ${a##*.} == [pP][nN][gG] ]]; then
                old_size=$(ls -l $a | { read b c d e f g; echo $f ;} )
                echo -n "${NAME_}: $a $old_size -> "
                pngcrush -q $a $tmp_1
                rm -f -- $a
                mv -- $tmp_1 $a
                new_size=$(ls -l $a | { read b c d e f g; echo $f ;} )
                echo $new_size bytes
                (( old_total += old_size ))
                (( new_total += new_size ))
            else
                echo ${NAME_}: file $a either does not exist or is not a png file
            fi
        done ;;
    *) echo ${NAME_}: skipping $1 ; continue ;;
esac
percentage=$(echo "scale = 2; ($new_total*100)/$old_total" | bc)
reduction=$(echo $(( old_total - new_total )) \
| sed '{ s/$/@/; : loop; s/\(...\)@/@.\1/; t loop; s/@//; s/^\.//; }')
echo "${NAME_}: total size reduction: $reduction bytes (total size reduced to ${percentage}%)"
}


##################################################
# Scans a port, returns what's on it.		 #
##################################################

function port() {
lsof -i :"$1"
}



##################################################
# Portscan in one line				 #
##################################################

function portscan()
{
$HOST=127.0.0.1;for((port=1;port<=65535;++port));do echo -en "$port ";if echo -en "open $HOST $port\nlogout\quit" | telnet 2>/dev/null | grep 'Connected to' > /dev/null;then echo -en "\n\nport $port/tcp is open\n\n";fi;done
}


##################################################
# Print a row of characters across the terminal	 #
##################################################

###### Default character is "=", default color is white
function println()
{
echo -n -e "\e[038;05;${2:-255}m";printf "%$(tput cols)s"|sed "s/ /${1:-=}/g"
}



##################################################
# Pronounce an English word			 #
##################################################

###### usage:	pronounce "word1" "word2" "word3" "..."
function pronounce() { for a in $@; do wget -qO- $(wget -qO- "http://www.m-w.com/dictionary/$a" | grep 'return au' | sed -r "s|.*return au\('([^']*)', '([^'])[^']*'\).*|http://cougar.eb.com/soundc11/\2/\1|") | aplay -q; done }



###### usage:	pronounce_ "word1" "word2" "word3" "..."
# requires 'mpg123' - sudo apt-get install mp321, but better dictionary
function pronounce_() { wget -qO- $(wget -qO- "http://dictionary.reference.com/browse/$@" | grep 'soundUrl' | head -n 1 | sed 's|.*soundUrl=\([^&]*\)&.*|\1|' | sed 's/%3A/:/g;s/%2F/\//g') | mpg123 -; }



##################################################
# TTS						 #
##################################################

function readfile() { curl -sGA Mozilla -d "language=en&format=audio/mp3&options=MaxQuality&appid=To6RoRW0R9Pt9emvqxsqEImBiS_ElZ19Dxpu9j6WURkg*&text=`python3 -c 'from urllib.parse import quote_plus; from sys import stdin; print(quote_plus(stdin.read()))' <${1:?file name is empty}`" 'http://api.microsofttranslator.com/V2/Http.svc/Speak' | mpg321 -q -; }



##################################################
# Remount a device				 #
##################################################

function remount() {
	# copyright 2007 - 2010 Christopher Bratusek
	DEVICE=$1
	shift
	mount -oremount,$@ $DEVICE
}

##################################################
# X DISPLAY functions				 #
##################################################

function reset_display()
{
    if [ "$SHLVL" -eq 1 ]; then
        echo $DISPLAY > $HOME/.display
    else
        if [ -e $HOME/.display ]; then
            export DISPLAY=$(cat $HOME/.display)
        fi
    fi
}



function set_xtitle()
{
    if [ $TERM == "xterm" ]; then
        echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"
    fi
}
# if [ "$UID" -ne 0 ]; then
#     reset_display
# fi


##################################################
# Daemon management				 #
##################################################

# function restart() { sudo /etc/rc.d/$1 restart; }



# function start() { sudo /etc/rc.d/$1 start; }



# function stop() { sudo /etc/rc.d/$1 stop; }



##################################################
# Log rm commands				 #
##################################################

function rm_log() {         workingdir=$( pwdx $$ | awk '{print $2}' )         /bin/rm $*         echo "rm $* issued at $(date) by the user $(who am i| awk '{print $1} ') in the directory ${workingdir}"  >> /tmp/rm.out ; }


##################################################
# Make a backup before editing a file		 #
##################################################

function safeedit() {
cp $1 ${1}.backup && vim $1
}

##################################################
# ShowTimes: show the modification, metadata-	 #
# change, and access times of a file		 #
##################################################

function showTimes() { stat -f "%N:   %m %c %a" "$@" ; }




##################################################
# Spellchecking					 #
##################################################


###### spell checks either a Web page URL or a file
# requires ispell: sudo apt-get install ispell
function spellchecker()
{
okaywords="$HOME/.okaywords"
tempout="/tmp/webspell.$$"
trap "/bin/rm -f $tempout" 0
if [ $# -eq 0 ] ; then
  echo "Usage: webspell file|URL" >&2;
fi
for filename
do
  if [ ! -f "$filename" -a "$(echo $filename|cut -c1-7)" != "http://" ] ; then
     continue;      # picked up directory in '*' listing
  fi
  lynx -dump $filename | tr ' ' '\n' | sort -u | \
    grep -vE "(^[^a-z]|')" | \
    # adjust the following line to produce just a list of misspelled words
    ispell -a | awk '/^\&/ { print $2 }' | \
    sort -u > $tempout
  if [ -r $okaywords ] ; then
    # if you have an okaywords file, screen okay words out
    grep -vif $okaywords < $tempout > ${tempout}.2
    mv ${tempout}.2 $tempout
  fi
  if [ -s $tempout ] ; then
    echo "Probable spelling errors: ${filename}"
    echo '-------' ; cat $tempout ; echo '========='
    cat $tempout | paste - - - -  | sed 's/^/  /'
  fi
done
}


##################################################
# Set/Unset a proxy for the terminal using tor	 #
##################################################

###### For a HTTP proxy in a single terminal window, simply run the following command in a terminal:
# export http_proxy='http://YOUR_USERNAME:YOUR_PASSWORD@PROXY_IP:PROXY_PORT/'
# For a secure connection (HTTPS), use:
# export https_proxy='http://YOUR_USERNAME:YOUR_PASSWORD@PROXY_IP:PROXY_PORT/'
# Obviously, replace everything with your username, password, proxy ip and port.
# If the proxy does not require an username and password, skip that part
function temproxy()
{
export http_proxy='http://localhost:8118'
export https_proxy='http://localhost:8118'
}



###### To close the HTTP proxy in the terminal, either close the terminal, or enter this:
function temproxyX()
{
unset http_proxy
unset https_proxy
}



##################################################
# A function to find the fastest free DNS server #
##################################################

###### requires: sudo apt-get install moreutils
function timeDNS() { { for x in "${local_DNS}" "208.67.222.222" "208.67.220.220" "198.153.192.1" "198.153.194.1" "156.154.70.1" "156.154.71.1" "8.8.8.8" "8.8.4.4"; do ({ echo -n "$x "; dig @"$x" "$*"|grep Query ; }|sponge &) done ; } | sort -n -k5 ; }


##################################################
# Touchpad stuff				 #
##################################################

###### to get information on touchpad
alias touchpad_id='xinput list | grep -i touchpad'



###### to disable touchpad
# using 'touchpad_id', set the number for your touchpad (default is 12)
function touchpad_off()
{
touchpad=12
xinput set-prop $touchpad "Device Enabled" 0
}



###### to enable touchpad
# using 'touchpad_id', set the number for your touchpad (default is 12)
function touchpad_on()
{
touchpad=12
xinput set-prop $touchpad "Device Enabled" 1
}


##################################################
# Moves specified files to ~/.Trash		 #
##################################################

###### will not overwrite files that have the same name
function trashit()
{   local trash_dir=$HOME/.Trash
    for file in "$@" ; do
        if [[ -d $file ]] ; then
            local already_trashed=$trash_dir/`basename $file`
            if [[ -n `/bin/ls -d $already_trashed*` ]] ; then
                local count=`/bin/ls -d $already_trashed* | /usr/bin/wc -l`
                count=$((++count))
                /bin/mv --verbose "$file" "$trash_dir/$file$count"
                continue
            fi
        fi
        /bin/mv --verbose --backup=numbered "$file" $HOME/.Trash
    done
}



##################################################
# Changes spaces to underscores in names	 #
##################################################

function underscore()
{
	for f in * ; do
    	[ "${f}" != "${f// /_}" ]
		mv -- "${f}" "${f// /_}"
	done
}



##################################################
# Decompiler for jar files using jad		 #
##################################################

function unjar() { mkdir -p /tmp/unjar/$1 ; unzip -d /tmp/unjar/$1 $1 *class 1>/dev/null && find /tmp/unjar/$1 -name *class -type f | xargs jad -ff -nl -nonlb -o -p -pi99 -space -stat ; rm -r /tmp/unjar/$1 ; }



##################################################
# Remove all files created by latex		 #
##################################################

function unlatex() {
if [ "$1" == "" ]; then
return
fi
i=${1%%.*}
rm -f $i.aux $i.toc $i.lof $i.lot $i.los $i.?*~ $i.loa $i.log $i.bbl $i.blg $i.glo
rm -f $i.odt $i.tns $i.fax $i.bm $i.out $i.nav $i.snm
rm -f $i.mtc* $i.bmt
mv -f $i.dvi .$i.dvi
mv -f $i.ps .$i.ps
mv -f $i.pdf .$i.pdf
rm -f $i.dvi $i.ps $i.pdf
unset i
}



##################################################
# Move all files in current directory 		 #
# (recursively) up a level			 #
##################################################

function upalevel()
{
find . -type f | perl -pe '(s!(\./.*/)(.*)!mv "\1\2" "\1../\2"!);' | sh
}



##################################################
# Short URLs with ur1.ca			 #
##################################################

function ur1() { curl -s --url http://ur1.ca/ -d longurl="$1" | sed -n -e '/Your ur1/!d;s/.*<a href="\(.*\)">.*$/\1/;p' ; }



##################################################
# Easily decode unix-time (function)		 #
##################################################

function utime() { perl -e "print localtime($1).\"\n\"";}



##################################################
# Echo a command, then execute it		 #
##################################################

function v_() { echo "$@"; "$@"; }



##################################################
# Edit a executable script			 #
##################################################

function vie() { vi $(which $1); }



##################################################
# Run a command, redirecting output to a file, 	 #
# then edit the file with vim			 #
##################################################

function vimcmd() { $1 > $2 && vim $2; }



##################################################
# Crawl a webpage for links			 #
##################################################

function webcrawl()
{
lynx -dump $1 | grep -A999 "^References$" | tail -n +3 | awk '{print $2 }'
}



##################################################
# Download all files of a certain type with wget #
##################################################

###### usage: wgetall mp3 http://example.com/download/
function wgetall() { wget -r -l2 -nd -Nc -A.$@ $@ ; }



##################################################
# Wordcount					 #
##################################################

###### counts frequency of words in a file
function wordfreq()
{
cat "$1"|tr -d '[:punct:]'|tr '[:upper:]' '[:lower:]'|tr -s ' ' '\n'|sort|uniq -c|sort -rn
}



###### word counter
function words()
{
# words.sh
# counts words in selection and displays result in zenity window
# dependencies xsel, wc, zenity
text=$(xsel)
words=$(wc -w <<<$text)
zenity --info --title "Word Count" --text "Words in selection:\n${words}\n\n\"${text}\""
}



##################################################
# ISO-writer					 #
##################################################

function writeiso() {
	# copyright 2007 - 2010 Christopher Bratusek
	if [[ $CD_WRITER ]]; then
		cdrecord dev=$CD_WRITER "$1"
	else	cdrecord deV=/dev/dvdrw "$1"
	fi
}


##################################################
# X delete - removes files with desired name	 #
# in current directory				 #
##################################################

if [[ ${BASH_VERSINFO[0]} -ge "4" ]]; then
function xdel() {
		# copyright 2007 - 2010 Christopher Bratusek
		shopt -s globstar
		[[ "$@" != "" ]] &&
			{ for argv in "$@"; do
				rm -fv ./**/*"$argv"
			done }
	}
fi



##################################################
# Parallel XZ with progress bar			 #
##################################################

function compressxz() { THREADS=`grep processor /proc/cpuinfo | wc -l`; for file in $*; do pv -s `stat -c%s $file` < $file | pxz -q -T $THREADS > $file.xz ; done; }


##################################################
# To create a ZIP archive of a file or folder	 #
##################################################

function zipf() { zip -r "$1".zip "$1" ; }



######################################################################################################################################################
###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ###### ALIASES ######
######################################################################################################################################################


##################################################
# Computer cleanup				 #
##################################################

alias adobecleanup='sudo rm -fr ~/.adobe/* && sudo rm -fr ~/.macromedia/* && sudo rm -fr /root/.adobe/* && sudo rm -fr /root/.macromedia/*'
alias bleachbitcleanup='sudo bleachbit --clean --preset'
alias cachecleanup='sudo rm -fr /root/.cache/* && sudo rm -fr ~/.cache/*'				# cleanup cache
alias cleanup="sudo apt-get -y autoclean && sudo apt-get -y autoremove && sudo apt-get -y clean && sudo apt-get -y remove && sudo aptitude -y purge `dpkg --get-selections | grep deinstall | awk '{print $1}'` && sudo deborphan | xargs sudo apt-get -y remove --purge && sudo bleachbit --clean --preset && sudo rm -rf ~/.adobe/* ~/.amsn/*/*/cache/ ~/.amsn/*/logs/ ~/.amsn/*/voiceclips/ ~/.amsn/*/webcam/ ~/.aMule/logfile ~/.aMule/logfile.bak ~/.aMule/Temp/ ~/.azureus/active/*.bak ~/.azureus/ipfilter.cache ~/.azureus/*.log ~/.azureus/logs/ ~/.azureus/tmp/ ~/.bash_history ~/.beagle/Indexes/ ~/.beagle/Log/ ~/.beagle/TextCache/ ~/.cache/* ~/.cache/audacious/thumbs/ ~/.cache/chromium/ ~/.cache/google-chrome/ ~/.cache/vlc/ ~/.compiz/session/ ~/.config/audacious/log ~/.config/audacious/playlist.xspf ~/.config/chromium/Default/Bookmarks.bak ~/.config/chromium/Default/Cookies ~/.config/chromium/Default/Current\ Session ~/.config/chromium/Default/Current\ Tabs ~/.config/chromium/Default/databases/Databases.db ~/.config/chromium/Default/databases/http*/ ~/.config/chromium/Default/Extension\ Cookies ~/.config/chromium/Default/Favicons/ ~/.config/chromium/Default/*History* ~/.config/chromium/Default/*History*/ ~/.config/chromium/Default/*-journal ~/.config/chromium/Default/Last\ Session ~/.config/chromium/Default/Last\ Tabs ~/.config/chromium/Default/Local\ Storage/*localstorage ~/.config/chromium/Default/Thumbnails* ~/.config/chromium/Default/Top\ Sites ~/.config/chromium/Default/Visited\ Links ~/.config/chromium/Default/Web\ Data/chrome.autofill ~/.config/chromium/Default/Web\ Data/chrome.keywords ~/.config/chromium/Local\ State/HostReferralList.json ~/.config/chromium/Local\ State/StartupDNSPrefetchList.json ~/.config/compiz/ ~/.config/emesene*/*/cache/ ~/.config/emesene*/*/log* ~/.config/emesene*/*/logs/ ~/.config/google-chrome/Default/Cookies ~/.config/google-chrome/Default/Current\ Session ~/.config/google-chrome/Default/Current\ Tabs ~/.config/google-chrome/Default/databases/Databases.db ~/.config/google-chrome/Default/databases/http*/ ~/.config/google-chrome/Default/Extension\ Cookies ~/.config/google-chrome/Default/Favicons/ ~/.config/google-chrome/Default/*History* ~/.config/google-chrome/Default/History/ ~/.config/google-chrome/Default/Last\ Session ~/.config/google-chrome/Default/Last\ Tabs ~/.config/google-chrome/Default/Local\ Storage/http*localstorage ~/.config/google-chrome/Default/Preferences/dns_prefetching.json ~/.config/google-chrome/Default/Thumbnails* ~/.config/google-chrome/Default/Top\ Sites ~/.config/google-chrome/Default/Visited\ Links ~/.config/google-chrome/Default/Web\ Data/chrome.autofill ~/.config/google-chrome/Default/Web\ Data/chrome.keywords ~/.config/google-chrome/Local\ State/HostReferralList.json ~/.config/google-chrome/Local\ State/StartupDNSPrefetchList.json ~/.config/gpodder/cache/ ~/.config/real/rpcookies.txt ~/.config/Screenlets/*.log ~/.config/transmission/blocklists/ ~/.config/transmission/resume/ ~/.easytag/easytag.log ~/.elinks/cookies ~/.elinks/*hist ~/.evolution/cache/ ~/.exaile/cache/ ~/.exaile/covers/ ~/.exaile/exaile.log ~/.exaile/podcasts/ ~/.filezilla/recentservers.xml ~/.gconf/apps/gnome-settings/gnome-panel/%gconf.xml ~/.gconf/apps/gnome-settings/gnome-search-tool/%gconf.xml ~/.gftp/cache/ ~/.gftp/gftp.log ~/.gimp-*/tmp/ ~/.gl-117/logfile.txt ~/.gnome2/epiphany/ephy-favicon-cache.xml ~/.gnome2/epiphany/ephy-history.xml ~/.gnome2/epiphany/favicon_cache/ ~/.gnome2/epiphany/mozilla/epiphany/Cache/ ~/.gnome2/epiphany/mozilla/epiphany/cookies* ~/.gnome2/gedit-metadata.xml ~/.gnome2/rhythmbox/jamendo/ ~/.gnome2/rhythmbox/magnatune/ ~/.googleearth/Cache/dbCache.* ~/.googleearth/Temp/ ~/.hippo_opensim_viewer/cache/ ~/.hippo_opensim_viewer/logs/ ~/.icedteaplugin/cache/ ~/.java/deployment/cache/ ~/.kde/cache-*/ ~/.kde/cache-*/ ~/.kde*/share/apps/gwenview/recent*/*rc ~/.kde/share/apps/kcookiejar/cookies ~/.kde/share/apps/kcookiejar/cookies ~/.kde/share/apps/konqueror/autosave/ ~/.kde/share/apps/konqueror/closeditems_saved ~/.kde/share/apps/konqueror/konq_history ~/.kde*/share/apps/RecentDocuments/*.desktop ~/.kde/share/config/konq_history ~/.kde/tmp-*/ ~/.kde/tmp-localhost.localdomain/ ~/.libreoffice/*/*/*/cache/ ~/.libreoffice/*/*/registry/data/org/openoffice/Office/Common.xcu ~/.liferea_*/cache/ ~/.liferea_*/mozilla/liferea/Cache/ ~/.liferea_*/mozilla/liferea/cookies.sqlite ~/.links2/links.his ~/.local/share/gvfs-metadata/*.log ~/.local/share/gvfs-metadata/uuid* ~/.local/share/Trash/* ~/.luckyBackup/logs/ ~/.luckyBackup/snaps/ ~/.macromedia/* ~/.mc/filepos ~/.mc/history ~/.miro/icon-cache/ ~/.miro/miro-*log* ~/.miro/mozilla/Cache/ ~/.mozilla/default/Cache/ ~/.mozilla/extensions ~/.mozilla/firefox/Crash\ Reports/ ~/.mozilla/firefox/*.default/adblockplus/patterns-backup* ~/.mozilla/firefox/*.default/bookmarkbackups/ ~/.mozilla/firefox/*.default/Cache/ ~/.mozilla/firefox/*.default/cookies.* ~/.mozilla/firefox/*.default/downloads.sqlite ~/.mozilla/firefox/*.default/formhistory.sqlite ~/.mozilla/firefox/*.default/history.dat ~/.mozilla/firefox/*.default/minidumps/ ~/.mozilla/firefox/*.default/OfflineCache/ ~/.mozilla/firefox/*.default/reminderfox/*.bak* ~/.mozilla/firefox/*.default/sessionstore.* ~/.mozilla/firefox/*.default/startupCache/ ~/.mozilla/firefox/*.default/webappsstore.sqlite ~/.mozilla/seamonkey/*/Cache/ ~/.mozilla/seamonkey/*.default/cookies.sqlite ~/.mozilla/seamonkey/*.default/downloads.sqlite ~/.mozilla/seamonkey/*.default/urlbarhistory.sqlite ~/.mozilla/*/*.slt/chatzilla/logs/*log ~/.mozilla/*/*.slt/cookies.txt ~/.mozilla/*/*.slt/history.dat ~/.mozilla-thunderbird/*.default/signons.txt ~/.nautilus/metafiles/*/*.xml ~/.nautilus/saved-session-?????? ~/.nexuiz/data/dlcache/ ~/.ntrc_*/cookies.txt ~/.ntrc_*/history* ~/.openoffice.org/*/*/*/cache/ ~/.openoffice.org/*/*/registry/data/org/openoffice/Office/Common.xcu ~/.opera/*cache*/ ~/.opera/cookies4.dat ~/.opera/download.dat ~/.opera/global.dat ~/.opera/*history* ~/.opera/icons/ ~/.opera/pstorage/ ~/.opera/sessions/ ~/.opera/temporary_downloads/ ~/.opera/thumbnails/ ~/.opera/vlink4.dat ~/.opera/vps/????/md.dat ~/.purple/icons/ ~/.purple/logs/ ~/.recently-used.xbel ~/.recoll/xapiandb/ /root/.adobe/* /root/.cache/* /root/.local/share/Trash/* /root/.macromedia/* /root/.thumbnails/* /root/.Trash ~/.secondlife/cache/ ~/.secondlife/logs/ ~/.Skype/*/chatmsg[0-9]*.dbb ~/.Skype/*/chatsync/*/*.dat ~/.sw35/swiftweasel/*/Cache/ ~/.thumbnails/* ~/.thunderbird/*.default/Cache/ ~/.thunderbird/*.default/cookies.sqlite ~/.thunderbird/*.default/signons.sqlite ~/.thunderbird/*.default/signons.txt ~/.thunderbird/default/*.slt/Cache/ ~/.thunderbird/default/*.slt/cookies.sqlite ~/.thunderbird/default/*.slt/signons3.txt ~/.thunderbird/default/*.slt/signons.sqlite ~/.thunderbird/default/*.slt/signons.txt ~/.thunderbird/Profiles/*.default/Cache/ ~/.thunderbird/Profiles/*.default/cookies.sqlite ~/.thunderbird/Profiles/*.default/signons.sqlite ~/.Trash ~/.tremulous/servercache.dat /var/backups/ /var/cache/apt/archives/*.deb /var/cache/apt/archives/partial/*.deb /var/tmp/ ~/.viminfo ~/.wine/drive_c/winetrickstmp/ ~/.winetrickscache/ ~/.winetrickscache/ ~/.xchat2/logs/*log ~/.xchat2/scrollback/ ~/.xchat2/xchatlogs/*log ~/.xine/catalog.cache ~/.xsession-errors ~/.xsession-errors.old"
alias configpurge="sudo aptitude -y purge `dpkg --get-selections | grep deinstall | awk '{print $1}'`"	# purge configuration files of removed packages on debian systems
alias kernelcleanup="dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge"											# remove all unused Linux Kernel headers, images & modules
alias orphaned='sudo deborphan | xargs sudo apt-get -y remove --purge'
alias thumbnailcleanup='sudo rm -fr /root/.thumbnails/* && sudo rm -fr ~/.thumbnails/*'
alias tp='trash-put'											# sends files to trash instead of perm deleting w/rm
alias trash='sudo rm -fr ~/.local/share/Trash/* && sudo rm -fr /root/.local/share/Trash/* && sudo rm -fr /root/.Trash && sudo rm -fr ~/.Trash'


##################################################
# Directory shortcuts				 #
##################################################

alias wallpapers='cd ~/Pictures/Wallpapers'
alias backups='cd ~/Backups'
alias books='cd ~/eBooks'
alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias dropbox='cd ~/Dropbox'
alias home='cd ~/'
alias images='cd ~/Images'
alias localhost='cd /var/www'
alias movies='cd ~/Videos'
alias music='cd ~/Music'
alias public='cd ~/Public'
alias temp='cd ~/Temp'
alias test='cd ~/.test'
alias torrents='cd ~/Torrents'
alias videos='cd ~/Videos'



##################################################
# Information					 #
##################################################

alias big='function BIG() { find . -size +${1}M -ls; }; BIG $1'				# find large files in current directory
alias biggest='BLOCKSIZE=1048576; du -x | sort -nr | head -10'				# show biggest directories
alias biggest_user="ac -p | sort -nk 2 | awk '/total/{print x};{x=$1}"			# show which user has the most accumulated login time
alias boothistory='for wtmp in `dir -t /var/log/wtmp*`; do last reboot -f $wtmp; done | less'
alias charcount='wc -c $1'								# count number of characters in text file
alias codename='lsb_release -cs | sed "s/^./\u&/"'					# Linux version detail - just codename (Natty, Oneiric, etc)
alias color1='sh ~/.scripts/termcolor1'   						# displays colorset 1
alias color2='sh ~/.scripts/termcolor2'   						# displays colerset 2
alias color3='sh ~/.scripts/termcolor3'   						# displays colorset 3
alias counts='sort | uniq -c | sort -nr'						# a nice command for summarising repeated information
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'			# to find CPU hogs
alias cpus='grep -c ^processor /proc/cpuinfo'						# number of CPU's in a system
alias cpus_='grep "processor" /proc/cpuinfo | wc -l'					# number of CPU's in a system
alias cpu='sudo dmidecode | grep Core'							# CPU info in a system
alias cputemp='while sleep 1; do acpi -t | osd_cat -p bottom; done &'			# to get the CPU temperature continuously on the desktop
alias ctemp='sensors -f && sensors'							# to get the computer temperature in Fahrenheit and Celcius
alias df='df -h -x tmpfs -x usbfs'							# displays global disk usage by partition, excluding supermounted devices
alias directorydiskusage='du -s -k -c * | sort -rn'
alias dir='ls --color=auto --format=vertical'
alias diskwho='sudo iotop'
alias distro='lsb_release -is'								# Linux distro version (Ubuntu, Linux Mint, Debian, Fedora, etc)
alias distro_='cat /etc/lsb-release | grep DISTRIB_ID | cut -d '=' -f 2'		# Linux distro version (Ubuntu, Linux Mint, Debian, Fedora, etc)
alias distro_ver='lsb_release -rs'							# Linux version detail - just codename version (11.04, 11.10, etc)
alias distro_vers='lsb_release -ds'							# Linux distro and version details (Ubuntu 11.04)
alias dmidecode='sudo dmidecode --type 17 | more'					# check RAM sed and type in Linux
alias ducks='ls -A | grep -v -e '\''^\.\.$'\'' |xargs -i du -ks {} |sort -rn |head -16 | awk '\''{print $2}'\'' | xargs -i du -hs {}'	# useful alias to browse your filesystem for heavy usage quickly						# to show processes reading/writing to disk
alias du='du -h --max-depth=1'								# displays disk usage by directory, in human readable format
alias dush='du -sm *|sort -n|tail'							# easily find megabyte eating files or directories
alias env2='for _a in {A..Z} {a..z};do _z=\${!${_a}*};for _i in `eval echo "${_z}"`;do echo -e "$_i: ${!_i}";done;done|cat -Tsv'	# print all environment variables, including hidden ones
alias ffind='sudo find / -name $1'
alias free='free -m'									# RAM and SWAP detail in MBs
alias freqwatch='watch --interval 1 "cat /proc/acpi/thermal_zone/THRM/*; cat /proc/cpuinfo | grep MHz; cat /proc/acpi/processor/*/throttling"'  # monitor cpu freq and temperature
alias hardware='sudo lshw -html > hardware.html'					# overview of the hardware in the computer
# alias hgrep='history | grep --color=always'						# search commands history
alias hiddenpnps='unhide (proc|sys|brute)'						# forensic tool to find hidden processes and ports
alias hogc='ps -e -o %cpu,pid,ppid,user,cmd | sort -nr | head'				# display the processes that are using the most CPU time and memory
alias hogm='ps -e -o %mem,pid,ppid,user,cmd | sort -nr | head'				# display the processes that are using the most CPU time and memory
alias la_='ls -Al'									# show hidden files
alias l?='cat ~/technical/tips/ls'
alias lc='ls -ltcr'       								# sort by and show change time, most recent last
alias ldir='ls -lhA |grep ^d'
alias ld='ls -ltr' 									# sort by date
alias lfiles='ls -lhA |grep ^-'
alias lf="ls -Alh --color | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"	# full ls with octal+symbolic permissions
alias lgg='ls --color=always | grep --color=always -i'					# quick case-insenstive partial filename search
alias lh='ls -Al' 									# show hidden files
alias lh='ls -lAtrh' 									# sort by date and human readable
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias li='ls -ai1|sort' 								# sort by index number
alias linecount='wc -l $1'								# count number of lines in text file
alias lk='ls -lSr'									# sort by size
alias llllll='ls -FlaXo --color=auto'							# sort the extensions alphabetically; good for winfiles
alias lllll='ls -Fla --full-time -o -Q --color=auto'					# whatever
alias llll='ls -laS --color=auto'							# sort by size
alias lll='ls -Falot --color=auto'							# sort by mod time
alias ll_='ls -l'									# long listing
alias l.='ls -d .[[:alnum:]]* 2> /dev/null || echo "No hidden file here..."'		# list only hidden files
alias l='ls -hF --color'								# quick listing
alias lm_='ls -al |more'    								# pipe through 'more'
alias ln='ln -s'
alias lr='ls -lR'									# recursice ls
alias lrt='ls -lart'									# list files with last modified at the end
alias lsam='ls -am' 									# List files horizontally
alias lsdd='ls -latr'                                 					# sort by date
alias lsd='ls -l | grep "^d"'								# list only directories
alias lsize='ls --sort=size -lhr'							# list by size
alias lsl='ls -lah'                                   					# long list, human-readable
alias ls='ls -hF --color'								# add colors for filetype recognition
alias lsnew='ls -Alh --color=auto --time-style=+%D | grep `date +%D`'
alias lss='ls -shaxSr'                         			       			# sort by size
alias lsss='ls -lrt | grep $1'								# to see something coming into ls output: lss
alias lsx='ls -ax' 									# sort right to left rather then in columns
alias lt_='ls -alt|head -20' 								# 20, all, long listing, modification time
alias lt='ls -ltr'         								# sort by date, most recent last
alias lu='ls -ltur'        								# sort by and show access time, most recent last
alias lx='ls -lXB'									# sort by extension
# alias man='TERMINFO=~/.terminfo TERM=mostlike LESS=C PAGER=less man'			# cool colors for manpages
alias mem_hogs_ps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'		# to find memory hogs
alias mem_hogs_top='top -l 1 -o rsize -n 10'						# to find memory hogs
# alias mem='~/.scripts/realmem'							# estimates memory usage
alias mypc="hal-get-property --udi /org/freedesktop/Hal/devices/computer --key 'system.hardware.product'"		# show computer model
alias myps='/bin/ps -u "$USER" -o user,pid,ppid,pcpu,pmem,args|less'			# ps
alias numFiles='echo $(ls -1 | wc -l)'							# numFiles: number of (non-hidden) files in current directory
alias ontime='date -d @$(echo $(($(date +%s)-$(cat /proc/uptime|cut -d. -f1))))'	# knowing when a machine is turned on
alias packagelist_="sudo aptitude search -F %p ~i --disable-columns | sed 's/$/,/' | tr '\n\r' ' ' | sed 's/, $//'"	# list all packages (1-liner)
alias packagelist="sudo aptitude search -F %p ~i --disable-columns"			# show list of all packages (columns)
# alias packagelist='sudo dpkg --get-selections'					# show llist of all packages (columns)
alias phonesearch='grep '[0-9]\{3\}-[0-9]\{4\}' "$1"'					# search phone #'s in file (requires XXX-XXX-XXXX format)
alias processbycpuusage="ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed '/^ 0.0 /d'"
alias processbymemusage='ps -e -o rss=,args= | sort -b -k1,1n | pr -TW$COLUMNS'
alias processtree='ps -e -o pid,args --forest'
alias pss='ps -ef | grep $1'								# to check a process is running in a box with a heavy load: pss
alias rcommand='ls /usr/bin | shuf -n 1'						# get a random command
# alias rcommand='man $(ls /usr/bin | shuf -n 1)'					# get a random command
alias sete='set|sed -n "/^`declare -F|sed -n "s/^declare -f \(.*\)/\1 ()/p;q"`/q;p"'	# display environment vars only, using set
alias showallaliases='compgen -A alias'							# list bash alias defined in .bash_profile or .bashrc
alias showallfunctions='compgen -A function'						# list bash functions defined in .bash_profile or .bashrc
alias sizeof='du -sh'
alias space='df -h'									# disk space usage
alias sshall='logwatch --service sshd --range all --detail high --print --archives'
alias sshtoday='logwatch --service sshd --range today --detail high --print --archives'
alias superfind='sudo find / ! \( -path /proc -prune -o -path /tmp -prune -o -path /dev -prune -o -path /mnt -prune \) -name'
alias top20='du -xk | sort -n | tail -20'						# find the 20 biggest directories on the current filesystem
alias top-commands='history | awk "{print $2}" | awk "BEGIN {FS="|"} {print $1}" |sort|uniq -c | sort -rn | head -10'	# show most popular commands
alias topforever='top -l 0 -s 10 -o cpu -n 15'						# continual 'top' listing (every 10 sec) showing top 15 CPU things
alias topten='du -sk $(/bin/ls -A) | sort -rn | head -10'				# displays the top ten biggest folders/files in the current directory
alias top_='xtitle Processes on $HOST && top'						# uses the function 'xtitle'
alias top_processes="watch -n 1 'ps -aux | sort -nrk 4 | head'"				# monitoring which processes most use CPU
alias treefind_="find . | sed 's/[^/]*\//|   /g;s/| *\([^| ]\)/+--- \1/'"		# displays a tree of the arborescence
alias tree='tree -Cs'									# nice alternative to 'ls'
alias unusedkernels="dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'"											# show installed but unused linux headers, image, or modules
alias vdir='ls --color=auto --format=long'
alias ver='cat /etc/lsb-release'							# Ubuntu version details
alias version='sudo apt-show-versions'							# show version
alias whichall='{ command alias; command declare -f; } | command which --read-functions --read-alias -a'		# which alias
alias WHOAMI='getent passwd $(whoami) | cut -f 5 -d: | cut -f 1 -d,'			# prints out what the users name, notifyed in the gecos field is
alias wordcount='wc -w $1'								# count number of words in text file



##################################################
# Information (clock and date stuff)		 #
##################################################

alias am-pm='date +"%p"'								# AM/PM (ex. AM)
alias bdate2="date +'%a %Y-%m-%d %H:%M:%S %z'"						# date command (ex. Sun 2011-01-23 05:39:26 -0500)
alias bdate3='date "+%Y-%m-%d %A    %T %Z"'						# date command (ex. 2011-01-23 Sunday    05:39:23 EST)
alias bdate="date '+%a, %b %d %Y %T %Z'"						# date command (ex. Sun, Jan 23 2011 05:39:13 EST)
alias cal='cal -3' 									# show 3 months by default
alias date_='TZ=$TZ-72 date +%d.%m.%Y'							# solaris: get current date + 72 hours
alias dateformatcodes='date --help | sed -n '/^FORMAT/,/%Z/p''				# alias for seeing date's format codes
alias dateh='date --help|sed "/^ *%a/,/^ *%Z/!d;y/_/!/;s/^ *%\([:a-z]\+\) \+/\1_/gI;s/%/#/g;s/^\([a-y]\|[z:]\+\)_/%%\1_%\1_/I"|while read L;do date "+${L}"|sed y/!#/%%/;done|column -ts_'								# view all date formats, quick reference help alias
alias day='date +%A'									# day of the week (ex. Saturday)
alias DAY='date "+%A" | tr '[a-z]' '[A-Z]''						# day (text) (ex. SATURDAY)
alias day#='date +%d'									# date (numeric) (ex. 22)
alias daysleft='echo "There are $(($(date +%j -d"Dec 31, $(date +%Y)")-$(date +%j))) left in year $(date +%Y)."'	# how many days until the end of the year
alias epochdaysleft="perl -e 'printf qq{%d\n}, time/86400;'"				# perl one-liner to determine number of days since the Unix epoch
alias epochtime='date +%s'								# report number of seconds since the Epoch (ex. 1295779549)
alias month='date +%B'									# month (ex. January)
alias MONTH='date "+%B" | tr '[a-z]' '[A-Z]''						# month (text) (ex. JANUARY)
alias mytime='date +%H:%M:%S'								# shows just the current time (ex. 05:46:05)
alias ntpdate='sudo ntpdate ntp.ubuntu.com pool.ntp.org'				# time synchronisation with NTP (ex. 23 Jan 05:46:29)
alias oclock='read -a A<<<".*.**..*....*** 8 9 5 10 6 0 2 11 7 4";for C in `date +"%H%M"|fold -w1`;do echo "${A:${A[C+1]}:4}";done'   # odd clock
alias onthisday='grep -h -d skip `date +%m/%d` /usr/share/calendar/*'			# on this day
alias onthisday_='firefox http://en.wikipedia.org/wiki/$(date +'%b_%d')'		# what happened on this day in history?
alias secconvert='date -d@1234567890'							# convert seconds to human-readable format (ex. Fri Feb 13 18:31:30 EST 2009)
alias stamp='date "+%Y%m%d%a%H%M"'							# timestamp (ex. 20110123Sun0545)
alias time2='date +"%I:%M"'								# time (hours:minutes) (ex. 05:13)
alias time3='date +"%l:%M %p"'								# time (ex. 5:13 AM)
alias time4='date +"%H:%M"'								# time (hours:minutes) (ex. 05:13)
alias timestamp='date "+%Y%m%dT%H%M%S"'							# timestamp (ex. 20110123T054906)
alias today='date +"%A, %B %-d, %Y"'							# date command (ex. Sunday, January 23, 2011)
alias weeknum='date +%V'								# perl one-liner to get the current week number (ex. 03)



##################################################
# Miscellaneous					 #
##################################################

alias -- --='-;-'
alias -- ---='-;-;-'
alias -- ----='-;-;-;-'
alias -- -----='-;-;-;-;-'
alias ++='+;+'
alias +++='+;+;+'
alias ++++='+;+;+;+'
alias +++++='+;+;+;+;+'
alias 7z_it='7z a -mx=9 -ms=on archive.7z $1'						# create solid archive (best compression) with 7z
alias addrepo='sudo add-apt-repository'							# add a repo to repo .list
alias alert_helper='history|tail -n1|sed -e "s/^\s*[0-9]\+\s*//" -e "s/;\s*alert$//"'	# notified when job run in terminal is done using NotifyOSD
alias alert='notify-send -i gnome-terminal "Finished Terminal Job" "[$?] $(alert_helper)"'	# usage: sleep 5; alert
alias alph='cat "$1" | sort > "$1"'							# alphabetizes a file
alias alsamixer='alsamixer -V all'
alias bashrc-copy-r='sudo cp /root/.bashrc ~/.bashrc'
alias bashrc-copy='sudo cp ~/.bashrc /root/.bashrc'
alias bashrc-cpr='sudo cp ~/.bashrc /root/.bashrc && cp ~/.bashrc ~/Temp && gedit ~/.bashrc && exit'
alias bashrc='gedit ~/.bashrc & exit'
alias bashrc-root='sudo gedit ~/.bashrc & exit'
alias bashrc-temp='cp ~/.bashrc ~/Temp'
alias bbc='lynx -term=vt100 http://news.bbc.co.uk/text_only.stm'
alias bedit='vim ~/.bashrc; source ~/.bashrc'
alias beep='echo -en "\007"'								# ring the bell
alias bgedit='gedit ~/.bashrc; source ~/.bashrc'
alias blipfm="mpg123 `curl -s http://blip.fm/all | sed -e 's#"#\n#g'  | grep mp3$  | xargs`"	# play random music from blip.fm
alias capture='IMAGE="$HOME/Pictures/capture-`date +%Y%m%d%H%M%S`.png"; import -frame $IMAGE; echo "Image saved as $IMAGE"'	# save portion of desktop as image
alias cic='set completion-ignore-case On'						# make tab-completion case-insensitive
alias clisp='clisp -q'
alias commentremove="sed 's/[[:blank:]]*#.*//; /^$/d' "$1""				# this will remove comments that are at the end of lines
alias compiz-replace='compiz --replace'							# refreshes compiz (fixes drag/drop issue, among others)
alias cut80='/usr/bin/cut -c 1-80'							# truncate lines longer than 80 characters (for use in pipes)
alias debrepack='sudo dpkg-repack'							# just an easier-to-remember alias for 'dpkg-repack'
alias differ='sdiff --suppress-common-lines'						# bash alias for sdiff: differ
alias dmregister='lynx http://desmoinesregister.com'
alias dos2unix_='perl -pi -e 's/\r\n/\n/g' *'
alias downNuncompress='wget http://URL/FILE.tar.gz -O- | tar xz'			# download a file and uncompress it while it downloads
# alias downNuncompress='curl http://URL/FILE.tar.gz | tar xz'				# download a file and uncompress it while it downloads
alias du0='du --max-depth=0'
alias du1='du --max-depth=1'
alias ebrc='nano ~/.bashrc'
alias ebrcupdate='source ~/.bashrc'
alias edit='nano'
alias elog='tai64nlocal'
alias encryptall='for f in * ; do [ -f $f ] && openssl enc -aes-256-cbc -salt -in $f -out $f.enc -pass file:/tmp/password-file ; done'	# encrypt every file in current directory with 256-bit AES, retaining original
alias fixmount='sudo e2fsck -f /dev/sda1'						# repair device booting/mounting error (for /dev/sda1)
alias fixopera='rm -r ~/.opera/{mail,lock}'
alias fixres='xrandr --size 1600x1200'      						# reset resolution
alias fix_stty='stty sane'								# restore terminal settings when they get completely screwed up
alias flv2ogg='for i in $(ls *.flv); do ffmpeg2theora -v 6 --optimize $i; done'		# convert all FLV's in a directory to Ogg Theora (video)
alias foldpb='pbpaste | fold -s | pbcopy'						# make text in clipboard wrap so as to not exceed 80 characters
alias funkcje="grep -o '^[a-zA-Z]\{1,\}.(*)' ~/.bashrc"
alias gdbbt='gdb -q -n -ex bt -batch'							# print stack trace of a core file without needing to enter gdb interactively
alias gifted='giftd -d && giFTcurs'
alias gitk='screen -d -m gitk'
alias gmail='sh /$HOME/.scripts/gmail.sh'
alias googlevideo='wget -qO- "VURL" | grep -o "googleplayer.swf?videoUrl\\\x3d\(.\+\)\\\x26thumbnailUrl\\\x3dhttp" | grep -o "http.\+" | sed -e's/%\([0-9A-F][0-9A-F]\)/\\\\\x\1/g' | xargs echo -e | sed 's/.\{22\}$//g' | xargs wget -O "$1"'	# Google video download
alias gsop='gmplayer http://localhost:8909 -prefer-ipv4'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'		# alias HEAD for automatic smart output
alias hiresvideo='mplayer -framedrop -vfm ffmpeg -lavdopts lowres=1:fast:skiploopfilter=all'	# play high-res video files on a slow processor
alias image2pdf='convert -adjoin -page A4 *.jpeg multipage.pdf'				# convert images to a multi-page pdf
alias irb='irb --readline -r irb/completion -rubygems'
alias jargon='wget -m http://catb.org/~esr/jargon/html/ -nH --cut-dirs=2 -np -L -P ~/Jargon/'
alias kernbuild='make -j3 && make modules_install && ls -ld ../linux && date'		# compile kernel, install modules, display kernel vers & date
alias kfire='for i in `ps aux | grep [F]irefox `; do echo $i; kill $(($i)); done; '
# alias kfire='kill $(pidof firefox)'
# alias kfire='kill $(ps aux | awk '/firefox/ {print $2}' | tr '\n' ' ')'
alias killall='killall -u $USER -v' 							# only kill our own processes, and also be verbose about it
alias killall_wine='wineserver -k'							# stop all Wine apps and processes
alias lastlog='lastlog | grep -v Never'
alias less='less -Mw'
alias lssd='ps ax | grep -v grep | grep -i firefox | while read pid; do kill "${pid%% *}"; done'
alias lstexfont='ls {/usr/share/texmf-dist/tex/latex/psnfss/*.sty,/usr/share/texmf-dist/tex/latex/pxfonts/*.sty}'
alias lvim="vim -c \"normal '0\""							# open the last file you edited in Vim.
alias makepasswd='makepasswd -minchars 8'
alias make_='xtitle Making $(basename $PWD) ; make'					# uses the function 'xtitle'
alias mencoder-join='mencoder -forceidx -ovc copy -oac copy -o'				# just add: whatever.avi whatever.pt1.avi whatever.pt2.avi ...
alias memlimit='ulimit -v 1000000; $1'							# limit memory usage per script/program
alias mic_record='arecord -q -f cd -r 44100 -c2 -t raw | lame -S -x -h -b 128 - `date +%Y%m%d%H%M`.mp3'	# record microphone input and output to date stamped mp3 file
alias mid='printf "\e[8;24;80;t"'							# resize participating terminals to classic 80x24 size
alias minicom='minicom -c on' 								# enable colour (sudo apt-get install minicom)
alias mkdirday='mkdir `date +%Y%m%d`_$1'						# (by Karl Voit) creates directory that starts with current day
alias mkdsp='sudo mknod /dev/dsp c 14 3 && sudo chmod 777 /dev/dsp'			# remake /dev/dsp
alias mkpkg='makepkg -csi'
alias mp3ogg='mp32ogg *.mp3 && rm *.mp3'
alias mpfb='mplayer -vo fbdev -xy 1024 -fs -zoom "$1"'					# watch a movie in linux without the X windows system
alias mpfb_='mplayer -vo fbdev2 -fs -zoom -xy 1440'
alias mtrue='sudo truecrypt /media/usbdisk/$USER.tc ~/$USER'
alias n2r='sudo /etc/init.d/nginx stop && sleep 2 && sudo /etc/init.d/nginx start'
alias ncftp='xtitle ncFTP ; ncftp'							# uses the function 'xtitle'
alias nytimes='lynx -term=vt100 http://nytimes.com'
alias passwords='passwd && rm -rf ~/.gnome2/keyrings/*'					# removes keyring passwords and lets you change user password
alias ppa-purge='sudo ppa-purge'
alias pstree='/sw/bin/pstree -g 2 -w'
alias puttyreload='export TERM=putty && source ~/.bashrc'
alias quota='quota -s'  								# human readable quota!
alias recursivetouch='find . -exec touch {} \;'						# be careful with this as it can modify time stamp of files
alias repo='gksudo gedit /etc/apt/sources.list'
alias restart-apache='sudo /etc/init.d/apache2 restart'
alias retheme='sudo gnome-settings-daemon'						# refreshes the theme to fix grey basic theme error at startup
alias rkhunter='sudo rkhunter -c'
alias rmao='find . -iname a.out -exec rm {} \;'
alias rm_DS_Store_files='find . -name .DS_Store -exec rm {} \;'				# removes all .DS_Store file from the current dir and below
alias rsync-me='sudo rsync -a -v --progress --delete --modify-window=1 -s $HOME /home/rsync'
alias scpresume='rsync --partial --progress --rsh=ssh'
# alias screencast='ffmpeg -f alsa -ac 2 -i hw:0,0 -f x11grab -r 30 -s 1280x800+0+0 -i :0.0 -acodec pcm_s16le -vcodec libx264 -vpre lossless_ultrafast -threads 0 -y output.mkv'
# alias screencast='ffmpeg -f x11grab -r 30 -s 1280x800 -i :0.0 $HOME/outputFile.mpg'	# record a screencast and convert it to an mpeg
alias screencast="ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4"		# capture video of a linux desktop
alias screenr='screen -r $(screen -ls | egrep -o -e '[0-9]+' | head -n 1)'		# quick enter into a single screen session
alias screen_restart='sudo /etc/init.d/gdm restart'					# restarts screen to login screen so as to get back in
alias sdiff='/usr/bin/sdiff --expand-tabs --ignore-all-space --strip-trailing-cr --width=160'	# sdiff the way it was at IBM
alias sdirs='source ~/.dirs'
alias service='sudo service'								# access a system service
alias sh_diff='diff -abBpur'
alias sh_indent='indent -nsaf -npcs -cli2 -i2 -lp -nprs -nsaw -nut -cbi2 -bli0 -bls -nbad -npsl'
alias shot!='archey && scrot -d 5 -c screen_`date +%Y-%m-%d`.png'			# is also a function of shot which does the screen for one window
alias show_='cat ~/.dirs'
alias show-colors='~/.bin/colors.sh'
alias show-info='~/.bin/info.pl'
alias show_options='shopt'								# show_options: display bash options settings
alias showrepo='cat /etc/apt/sources.list `ls /etc/apt/sources.list.d/*.list` | egrep -v "^$"'
alias sh_svnstat="svn status | awk '/^[^?]/'"
alias sourcea='source ~/.aliases.bash'							# to source this file (to make changes active after editing)
alias spaceremover="sed -i 's/\s\+/ /g;s/\s*$//' $1"					# get rid of multiple spaces/tabs in a text file
alias ssinfo='perl ~/.scripts/ssinfo.pl'
# alias svnaddall='find "$PWD" -exec svn add {} 2>/dev/null \;'				# add all files recursively
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'
alias svndelall='svn status | grep "^\!" | awk "{print \$2}" | xargs svn delete'
alias svnrmallentries='find . -name .svn -print0 | xargs -0 rm -rf'			# remove all .svn directories recursively
alias tailm='multitail'
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$"F "$D" &>/dev/null ) & )'					# create date-based tgz of current dir (runs in background)
# alias themeinfo='perl ~/Scripts/info.pl'
alias thumbit='mogrify -resize 25%'
alias tinyurl='~/.scripts/tinyurl'							# converts url to tinyurl
alias tkeys='tmux list-keys'  								# shows all tmux keys
alias trace='~/.scripts/trace'								# visual traceroute
alias txt2md='rename 's/\.txt$/\.md$/i' *'						# batch rename extension of all .txt files to .md files in a folder
alias ugrub2='sudo update-grub2'							# update grub2
alias ugrub='sudo update-grub'								# update grub
alias updatedb='sudo updatedb'
alias updatefonts='sudo fc-cache -vf'
alias usbb='rsync -avz /media/usbdisk/ ~/backup/usb/'
alias utrue='sudo truecrypt -d'
alias viaco='task="$(basename "$(pwd)")"; if [ -f "$task.c" ]; then vi -c "set mouse=n" -c "set autoread" -c "vsplit $task.out" -c "split $task.in" -c "wincmd l" -c "wincmd H" $task.c; fi'							# setup Vim environment for USACO coding
alias webcam='mplayer -cache 128 -tv driver=v4l2:width=176:height=177 -vo xv tv:// -noborder -geometry "95%:93%" -ontop'	# mplayer webcam window for screencasts
alias webshare='python -c "import SimpleHTTPServer; SimpleHTTPServer.test();"'
alias wiki='wikipedia2text -p'								# convert wiki to text output
alias xinitrc='vim ~/.xinitrc'
alias xsnow='(killall xsnow ; sleep 3 ; exec xsnow -nosanta -notrees -norudolf -nokeepsnow >& /dev/null &)'	# xsnow



###################################################
# Miscellaneous Fun				 #
###################################################

alias 99bottles='x="bottles of beer";y="on the wall";for b in {99..1};do echo "$b $x $y, $b $x. Take one down pass it around, $(($b-1)) $x $y"; sleep 3;done'
alias addictive='count="1" ; while true ; do read next ; if [[ "$next" = "$last" ]] ; then count=$(($count+1)) ; echo "$count" ; else count="1" ; echo $count ; fi ; last="$next" ; done'								# simple addicting bash game
alias aljazeera='rtmpdump -v -r rtmp://livestfslivefs.fplive.net/livestfslive-live/ -y "aljazeera_en_veryhigh" -a "aljazeeraflashlive-live" -o -| mplayer -'												# watch Aljazeera live
alias awesome='while $i;do `notify-send -t 200 "You are awesome :)"`;sleep 60; done;'		# get informed periodically by your box that you are awesome
alias busy='for i in `seq 0 100`;do timeout 6 dialog --gauge "Install..." 6 40 "$i";done'	# pretend to be busy in office to enjoy a cup of coffee
alias busy2='my_file=$(find /usr/include -type f | sort -R | head -n 1); my_len=$(wc -l $my_file | awk "{print $1}"); let "r = $RANDOM % $my_len" 2>/dev/null; vim +$r $my_file'
alias busy3='cat /dev/urandom | hexdump -C | highlight ca fe 3d 42 e1 b3 ae f8 | perl -MTime::HiRes -pnE "Time::HiRes::usleep(rand()*1000000)"'
# alias earth='mv ~/Pictures/Backgrounds/mercator.jpg ~/Pictures/Backgrounds/mercator.`timestamp`.jpg | wget -r -N http://static.die.net/earth/mercator/1600.jpg -O ~/Pictures/Backgrounds/mercator.jpg && gconftool-2 --type string --set /desktop/gnome/background/picture_filename ~/Pictures/Backgrounds/mercator.jpg'	# live earth wallpaper (downloads and saves each time) (GNOME2)
# alias earth='mv ~/Pictures/Backgrounds/mercator.jpg ~/Pictures/Backgrounds/mercator.`timestamp`.jpg | wget -r -N http://static.die.net/earth/mercator/1600.jpg -O ~/Pictures/Backgrounds/mercator.jpg && gsettings set org.gnome.desktop.background picture-uri "file://$HOME/Pictures/Backgrounds/mercator.jpg"'	# live earth wallpaper (downloads and saves each time) (GNOME3)
# alias earth='rm -f ~/Pictures/Backgrounds/mercator.jpg && wget -r -N http://static.die.net/earth/mercator/1600.jpg -O ~/Pictures/Backgrounds/mercator.jpg && gconftool-2 --type string --set /desktop/gnome/background/picture_filename ~/Pictures/Backgrounds/mercator.jpg'	# live earth wallpaper (GNOME2)
alias earth='rm -f ~/Pictures/Backgrounds/mercator.jpg && wget -r -N http://static.die.net/earth/mercator/1600.jpg -O ~/Pictures/Backgrounds/mercator.jpg && gsettings set org.gnome.desktop.background picture-uri "file://$HOME/Pictures/Backgrounds/mercator.jpg"'	# live earth wallpaper (GNOME3)
alias einsteiny='A=1;B=100;X=0;C=0;N=$[$RANDOM%$B+1];until [ $X -eq $N ];do read -p "N between $A and $B. Guess? " X;C=$(($C+1));A=$(($X<$N?$X:$A));B=$(($X>$N?$X:$B));done;echo "Took you $C tries, Einstein";'						# numbers guessing game
alias etchasketch='c=12322123;x=20;y=20;while read -sn1 p;do k=${c:(p-1)*2:2};let x+=$((k/10-2));let y+=$((k%10-2));echo -en \\033[$y\;"$x"HX;done'	# use the 1 2 3 and 4 keys to move the cursor around the screen (It's an etch-a-sketch for your terminal!)
alias excuses='echo `telnet bofh.jeffballard.us 666 2>/dev/null` |grep --color -o "Your excuse is:.*$"'		# excuses
alias freechess='telnet fics.freechess.org 5000'						# connects to a telnet server for free internet chess
alias funfacts='wget http://www.randomfunfacts.com -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias funknet='telnet the-funk.net 7000'							# Access to Funk.net
alias futurama='curl -Is slashdot.org | sed -n '5p' | sed 's/^X-//''				# get Futurama quotations from slashdot.org servers
alias guitartune='for n in E2 A2 D3 G3 B3 E4;do play -n synth 4 pluck $n repeat 2;done'		# tune your guitar from the command line
alias iamcow='fortune | cowsay'
alias iamsurprise='fortune | cowsay -f $(random_cow)'
alias insults='wget http://www.randominsults.net -O - 2>/dev/null | grep \<strong\> | sed "s;^.*<i>\(.*\)</i>.*$;\1;";'
alias lotto='shuf -i 1-49 -n 6 | sort -n | xargs'						# lotto generator
alias matrix='echo -e "\e[32m"; while :; do for i in {1..16}; do r="$(($RANDOM % 2))"; if [[ $(($RANDOM % 5)) == 1 ]]; then if [[ $(($RANDOM % 4)) == 1 ]]; then v+="\e[1m $r   "; else v+="\e[2m $r   "; fi; else v+="     "; fi; done; echo -e "$v"; v=""; done'
alias matrix2='echo -e "\e[31m"; while $t; do for i in `seq 1 30`;do r="$[($RANDOM % 2)]";h="$[($RANDOM % 4)]";if [ $h -eq 1 ]; then v="\e[1m $r";else v="\e[2m $r";fi;v2="$v2 $v";done;echo -e $v2;v2="";done;'
alias matrix3='COL=$(( $(tput cols) / 2 )); clear; tput setaf 2; while :; do tput cup $((RANDOM%COL)) $((RANDOM%COL)); printf "%$((RANDOM%COL))s" $((RANDOM%2)); done'
alias matrix4='echo -ne "\e[32m" ; while true ; do echo -ne "\e[$(($RANDOM % 2 + 1))m" ; tr -c "[:print:]" " " < /dev/urandom | dd count=1 bs=50 2> /dev/null ; done'
alias matrix5='tr -c "[:digit:]" " " < /dev/urandom | dd cbs=$COLUMNS conv=lcase,unblock | GREP_COLOR="1;32" grep --color "[^ ]"'
alias roulette='[ $[ $RANDOM % 6 ] == 0 ] && echo Die || echo Live'				# command line Russian roulette
alias screensaver='for ((;;)); do echo -ne "\033[$((1+RANDOM%LINES));$((1+RANDOM%COLUMNS))H\033[$((RANDOM%2));3$((RANDOM%8))m$((RANDOM%10))"; sleep 0.1 ; done'												# terminal screensaver
alias starwars='telnet towel.blinkenlights.nl'							# the famous starwars ASCII version from telnet
alias termvideo_bw='mplayer -vo aa'								# watch movies in ASCII (just direct to the video)
alias termvideo='mplayer -vo caca'								# watch movies in ASCII (just direct to the video)
alias wooters='telnet zerocarbs.wooters.us'							# connects to a telnet service monitoring Woot (Gives you an updating woot! item tracker!)



##################################################
# Network/Internet -oriented stuff		 #
##################################################

alias appson="netstat -lantp | grep -i stab | awk -F/ '{print $2}' | sort | uniq"	# view only the process name using an internet connection
alias bandwidth='dd if=/dev/zero of=/dev/null bs=1M count=32768'			# processor / memory bandwidthd? in GB/s
alias browse_bonjour='dns-sd -B'							# browse services advertised via Bonjour
# alias daemons='ls /var/run/daemons'  							# daemon managment (ommited for function)
alias dbdumpcp='scp -P 1234 username@12.34.56.78:$HOME/Backup/www/data/someSite/db.sql $HOME/Backup/data/db.sql'	# copy remote db to local
alias dns='cat /etc/resolv.conf'							# view DNS numbers
alias domain2ban='~/.scripts/Domain2Ban.sh'
alias estab='ss -p | grep STA' 								# view only established sockets (fails if "ss" is screensaver alias)
alias finchsync='java -jar ~/finchsync/finchsync.jar'					# start FinchSync Admin
# alias ftop='watch -d -n 2 'df; ls -FlAt;''						# like top, but for files
alias hdinfo='hdparm -i[I] /dev/sda'							# hard disk information - model/serial no.
alias hostip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias hostname_lookup='lookupd -d'							# interactive debugging mode for lookupd (use tab-completion)
alias http_trace='pkt_trace port 80'							# to show all HTTP packets
alias iftop='sudo iftop -i eth0' 							# start "iftop" program (sudo apt-get install iftop)
alias ip4grep="grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}'"					# look for IPv4 address in files
alias ip='curl www.whatismyip.org'
alias ip_info='ipconfig getpacket en1'							# info on DHCP server, router, DNS server, etc (for en0 or en1)
alias ipt80='sudo iptstate -D 80'							# check out only iptables state of http port 80 (requires iptstate)
alias ip_trace='pkt_trace ip'								# to show all IP packets
alias ipttrans='sudo iptstate -D 51413'							# iptables state of Transmission-Daemon port (requires iptstate)
alias listen='sudo netstat -pnutl' 							# lists all listening ports together with PID of associated process
alias lsock='sudo /usr/sbin/lsof -i -P'							# to display open sockets ( -P option to lsof disables port names)
alias memrel='free && sync && echo 3 > /proc/sys/vm/drop_caches && free'		# release memory used by the Linux kernel on caches
alias net1='watch --interval=2 "sudo netstat -apn -l -A inet"'
alias net2='watch --interval=2 "sudo netstat -anp --inet --inet6"'
alias net3='sudo lsof -i'
alias net4='watch --interval=2 "sudo netstat -p -e --inet --numeric-hosts"'
alias net5='watch --interval=2 "sudo netstat -tulpan"'
alias net6='sudo netstat -tulpan'
alias net7='watch --interval=2 "sudo netstat -utapen"'
alias net8='watch --interval=2 "sudo netstat -ano -l -A inet"'
alias netapps="lsof -P -i -n | cut -f 1 -d ' '| uniq | tail -n +2"
alias nethogs='sudo nethogs eth0' 							# start "nethogs" program (sudo apt-get install nethogs)
alias netl='sudo nmap -sT -O localhost'
alias netscan='sudo iwlist wlan0 scan'							# to scan your environment for available networks, do the following
alias netstats='sudo iwspy wlan0'							# if card supports it, you can collect wireless statistics by using
alias network='sudo lshw -C network' 							# view network device info
alias networkdump='sudo tcpdump not port 22' 						# dump all the network activity except ssh stuff
alias nmr='sudo /etc/rc.d/networkmanager restart'
alias nsl='netstat -f inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2'		# show all programs connected or listening on a network port
alias ns='netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2'
alias openports='sudo netstat -nape --inet' 						# view open ports
alias oports="echo 'User:      Command:   Port:'; echo '----------------------------' ; lsof -i 4 -P -n | grep -i 'listen' | awk '{print \$3, \$1, \$9}' | sed 's/ [a-z0-9\.\*]*:/ /' | sort -k 3 -n |xargs printf '%-10s %-10s %-10s\n' | uniq"	# lsof (cleaned up for just open listening ports)
alias pkt_trace='sudo tcpflow -i `active_net_iface` -c'
alias ports='lsof -i -n -P' 								# view programs using an internet connection
alias portstats='sudo netstat -s' 							# show statistics for all ports
alias proxy1='ssh -p 1234 -D 5678 username@12.34.56.78'					# SOCKS proxy - these anonomise browsing - 12.34.56.78
alias proxy2='ssh -p 8765 -D 4321 username@87.65.43.21'					# SOCKS proxy - these anonomise browsing - 87.65.43.21
alias QUERY='psql -h $MYDBHOST -p 5432 -d $MYDB -U $MYLOGIN --no-align'			# lazy SQL QUERYING
alias randomip='echo $((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256))'	# generate a random IP address
alias ramvalue='sudo dd if=/dev/mem | cat | strings'					# will show you all the string (plain text) values in ram
alias randommac='python -c "from itertools import imap; from random import randint; print ':'.join(['%02x'%x for x in imap(lambda x:randint(0,255), range(6))])"'										# generate random valid mac addresses
alias rdp='rdesktop -u "$USER" -g 1600x1200 -D -r disk:home=/home -r clipboard:PRIMARYCLIPBOARD'	# quick full screen RDP connection
alias remote='ssh -p 1234 12.34.56.78'							# access some remote host
alias restartnet='sudo /etc/rc.d/network restart;sudo /etc/rc.d/wicd restart'
alias rssup='php /srv/http/rssupdate.php'
alias setessid='sudo iwconfig wlan0 essid network-essid'				# set the essid, which identifies the network access point you want
alias smtp_trace='pkt_trace port smtp'							# to show all SMTP packets
alias someDBdump='sudo mysqldump someDB -uroot -p > $HOME/www/_dbs/someDB.sql'
alias spavr='gtkterm -c avr'
# alias spavr='sudo chmod a=rw /dev/ttyUSB0; gtkterm -c avr'
alias spk800i='gtkterm -c k800i'
# alias spk800i='sudo chmod a=rw /dev/rfcomm0; gtkterm -c k800i'
alias sql='mysql -p -u root'
alias sync='java -jar ~/finchsync/finchsync.jar -nogui'					# sync to PDA .. well, that'll be a sync then! - start FinchSync SVR
alias syncoff='java -jar ~/Apps/FinchSync/finchsync.jar -stopserver'			# sync to PDA .. well, that'll be a sync then! - stop FinchSync SVR
alias tcpstats='sudo netstat -st' 							# show statistics for tcp ports
alias tcp_='sudo netstat -atp' 								# list all TCP ports
alias tcp_trace='pkt_trace tcp'								# to show all TCP packets
alias topsites='curl -s -O http://s3.amazonaws.com/alexa-static/top-1m.csv.zip ; unzip -q -o top-1m.csv.zip top-1m.csv ; head -1000 top-1m.csv | cut -d, -f2 | cut -d/ -f1 > topsites.txt'							# get a list of top 1000 sites from alexa
alias tproxy='ssh -ND 8118 user@server&; export LD_PRELOAD="/usr/lib/libtsocks.so"'	# creates a proxy based on tsocks
alias udpstats='sudo netstat -su' 							# show statistics for udp ports
alias udp='sudo netstat -aup' 								# list all UDP ports
alias udp_trace='pkt_trace udp'								# to show all UDP packets
alias uploads='cd /some/folder'								# access some folder
alias vncup='x11vnc -nopw -ncache 10 -display :0 -localhost'
alias website_dl='wget --random-wait -r -p -e robots=off -U mozilla "$1"'		# download an entire website
alias website_images='wget -r -l1 --no-parent -nH -nd -P/tmp -A".gif,.jpg" "$1"'	# download all images from a site
alias whois='whois -H'
alias wireless_sniffer='sudo ettercap -T -w out.pcap -i wlan0 -M ARP // //'		# sniff who are using wireless. Use wireshark to watch out.pcap
alias wscan_='iwlist scan'								# terminal network scan for wireless signals
alias wwwmirror2='wget -k -r -l ${2} ${1}'						# wwwmirror2 usage: wwwmirror2 [level] [site_url]
alias wwwmirror='wget -ErkK -np ${1}'



##################################################
# Package holding, making, and installation	 #
##################################################

alias checkinstall-force='sudo checkinstall --dpkgflags "--force-overwrite"'
alias checkinstall-noinstall='sudo checkinstall -y --fstrans=no --install=no'
alias checkinstall='sudo checkinstall -y --fstrans=no'
alias debinstall-force='sudo dpkg -i --force-overwrite'
alias debinstall='sudo dpkg -i'
alias diffinstall='diff /tmp/install.pre /tmp/install.pos | grep \"^>\" | sed \"s/^> //g\"'	# run diffinstall fourth, after diffinstall to show what files were copied in your system
alias postinstall='sudo find / ! \( -path /proc -prune -o -path /tmp -prune -o -path /dev -prune -o -path /mnt -prune \) > /tmp/install.pos'	# run postinstall third, after "make install"
alias preinstall='sudo find / ! \( -path /proc -prune -o -path /tmp -prune -o -path /dev -prune -o -path /mnt -prune \) > /tmp/install.pre'	# run preinstall first, then "make install"



##################################################
# Permissions					 #
##################################################

alias 000='chmod 000'
alias 640='chmod 640'
alias 644='chmod 644'
alias 755='chmod 755'
alias 775='chmod 775'
alias mx='chmod a+x'
alias perm='stat --printf "%a %n \n "'								# requires a file name e.g. perm file
alias restoremod='chgrp users -R .;chmod u=rwX,g=rX,o=rX -R .;chown $(pwd |cut -d / -f 3) -R .'	# restore user,group and mod of an entire website



##################################################
# Personal help					 #
##################################################

alias a?='cat ~/.alias.help'
alias dn='OPTIONS=$(\ls -F | grep /$); select s in $OPTIONS; do cd $PWD/$s; break;done'
alias espanol='echo -e \"á Á é É í Í ó Ó ú Ú ñ Ñ ü Ü ¿ ¡ ¢ ‘ ’ “ ” „ ‚ …\"'
alias f?='cat ~/.function.help'
alias help='OPTIONS=$(\ls ~/.tips -F);select s in $OPTIONS; do less ~/.tips/$s; break;done'
alias testh='help test|sed -e :a -e "$!N;s/\(-n STRING\)\n/\1, /;s/\n\( \{23\}\| \{4\}\([a-z]\)\)/ \2/;ta;P;D"|sed "s/ \{1,\}/ /g;/^ $/d;/:$/s/^/\n/"|sed -n "/File operators:/,\$p"'						# test quick help alias



##################################################
# Relinux stuff				 	 #
##################################################

alias relinux-clean='sudo relinux clean $HOME/.relinux.conf'		# cleans up files made by relinux
# alias relinux-clean='sudo relinux clean $HOME/relinux.conf'		# cleans up files made by relinux
alias relinux-config='sudo relinux config'				# generates a configuration file in the current directory
# alias relinux-fullclean='sudo relinux fullclean $HOME/relinux.conf'	# cleans up files made by relinux, including the ISO file
alias relinux-fullclean='sudo relinux fullclean $HOME/.relinux.conf'	# cleans up files made by relinux, including the ISO file
# alias relinux-iso='sudo relinux iso $HOME/relinux.conf'		# runs both 'relinux-onlyiso' & 'relinux-squashfs'
alias relinux-iso='sudo relinux iso $HOME/.relinux.conf'		# runs both 'relinux-onlyiso' & 'relinux-squashfs'
# alias relinux-onlyiso='sudo relinux onlyiso $HOME/relinux.conf'	# generates .iso file based on .squashfs file from 'relinux-squashfs'
alias relinux-onlyiso='sudo relinux onlyiso $HOME/.relinux.conf'	# generates .iso file based on .squashfs file from 'relinux-squashfs'
# alias relinux-squashfs='sudo relinux squashfs $HOME/relinux.conf'	# generates a .squashfs file from your system
alias relinux-squashfs='sudo relinux squashfs $HOME/.relinux.conf'	# generates a .squashfs file from your system



##################################################
# Remastersys stuff				 #
##################################################

alias remastersys-backup-custom='sudo remastersys backup custom.iso'	# to make a livecd/dvd backup and call the iso custom.iso
alias remastersys-backup='sudo remastersys backup'			# to make a livecd/dvd backup of your system
alias remastersys-clean='sudo remastersys clean'			# to clean up temporary files of remastersys
alias remastersys-dist-cdfs='sudo remastersys dist cdfs'		# to make a distributable livecd/dvd filesystem only
alias remastersys-dist-custom='sudo remastersys dist iso custom.iso'	# to make a distributable iso named custom.iso but only if cdfs is present
alias remastersys-dist='sudo remastersys dist'				# to make a distributable livecd/dvd of your system



##################################################
# Secure-delete substitution			 #
##################################################

alias sfill-freespace='sudo sfill -I -l -l -v'
alias sfill-f='sudo sfill -f -l -l -v -z'
alias sfill='sudo sfill -l -l -v -z'
alias sfill-usedspace='sudo sfill -i -l -l -v'
alias smem-f='sudo sdmem -f -l -l -v'
alias smem-secure='sudo sdmem -v'
alias smem='sudo sdmem -l -l -v'
alias srm-m='sudo srm -f -m -z -v'
alias srm='sudo srm -f -s -z -v'
alias sswap-sda5='sudo sswap -f -l -l -v -z /dev/sda5'
alias sswap='sudo sswap -f -l -l -v -z'
alias swapoff='sudo swapoff /dev/sda5'
alias swapon='sudo swapon /dev/sda5'



##################################################
# Set up auto extension stuff			 #
##################################################

###### If -s flags present, define suffix alias: if command word on command line is in form `text.name',
# where text is any non-empty string, its replaced by text 'value text.name'. Note that names treated as literal
# string, not pattern.  A trailing space in value is not special in this case. For example, alias -s ps=gv
# will cause command `*.ps' to be expanded to `gv *.ps'. As alias expansion is carried out earlier than globbing,
# `*.ps' will then be expanded. Suffix aliases constitute different name space from other aliases (so in above
# example its still possible to create alias for command ps) and two sets are never listed together.
# alias -s avi=mplayer
# alias -s bz2=tar -xjvf
# alias -s com=$BROWSER
# alias -s cpp=vim
# alias -s doc=soffice
# alias -s eps=eog
# alias -s gif=eog
# alias -s gz=tar -xzvf
# alias -s html=$BROWSER
# alias -s img=mplayer
# alias -s install=$EDITOR
# alias -s iso=mplayer
# alias -s java=$EDITOR
# alias -s jpg=eog
# alias -s mkv=mplayer
# alias -s mp3=mplayer
# alias -s mpeg=mplayer
# alias -s mpg=mplayer
# alias -s mws=maple
# alias -s net=$BROWSER
# alias -s odt=soffice
# alias -s org=$BROWSER
# alias -s pdf=evince
# alias -s php=$BROWSER
# alias -s PKGBUILD=vim
# alias -s png=eog
# alias -s ppt=soffice
# alias -s ps=gv
# alias -s se=$BROWSER
# alias -s sh=vim
# alias -s sxw=soffice
# alias -s tex=$EDITOR
# alias -s txt=$EDITOR
# alias -s wmv=mplayer
# alias -s xls=soffice



##################################################
# Shred substitution				 #
##################################################

alias shred-sda-r='sudo shred -v -z -n 1 /dev/sda'
alias shred-sda='sudo shred -v -z -n 0 /dev/sda'
alias shred-sdb-r='sudo shred -v -z -n 1 /dev/sdb'
alias shred-sdb='sudo shred -v -z -n 0 /dev/sdb'
alias shred-sdc-r='sudo shred -v -z -n 1 /dev/sdc'
alias shred-sdc='sudo shred -v -z -n 0 /dev/sdc'
alias shred-sdd-r='sudo shred -v -z -n 1 /dev/sdd'
alias shred-sdd='sudo shred -v -z -n 0 /dev/sdd'
alias shred-sde-r='sudo shred -v -z -n 1 /dev/sde'
alias shred-sde='sudo shred -v -z -n 0 /dev/sde'
alias shred-sdf-r='sudo shred -v -z -n 1 /dev/sdf'
alias shred-sdf='sudo shred -v -z -n 0 /dev/sdf'
alias shred-sdg-r='sudo shred -v -z -n 1 /dev/sdg'
alias shred-sdg='sudo shred -v -z -n 0 /dev/sdg'



##################################################
# Xterm and Aterm				 #
##################################################

alias aterm='xterm -ls -fg gray -bg black'
alias termb='xterm -bg AntiqueWhite -fg NavyBlue &'
alias termg='xterm -bg AntiqueWhite -fg OliveDrab &'
alias termr='xterm -bg AntiqueWhite -fg DarkRed &'
alias term='xterm -bg AntiqueWhite -fg Black &'
alias xsu='xterm -fn 7x14 -bg DarkOrange4 -fg white -e su &'
alias xtop='xterm -fn 6x13 -bg LightSlateGray -fg black -e top &'



##################################################
##################################################
##################################################








######################################################################################################################################################
#----- BASHRC ENDS HERE ------ BASHRC ENDS HERE ------ BASHRC ENDS HERE ------ BASHRC ENDS HERE ------ BASHRC ENDS HERE ------ BASHRC ENDS HERE ------
######################################################################################################################################################








fi	# end interactive check﻿








######################################################################################################################################################
################################### MY BASHRC FILE ################################### MY BASHRC FILE ################################### MY BASHRC FILE
######################################################################################################################################################
