#
# ~/.bashrc
#

# If not running interactively, don't do anything
export PATH=$PATH:$HOME/.local/bin
[[ $- != *i* ]] && return
alias lf=lfrun
alias fcs='sudo cp  /home/cyberborean/archive/blocked /etc/hosts'
alias unfcs='sudo cp /home/cyberborean/archive/unblocked /etc/hosts' 
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias smci='sudo make clean install'
alias fsbg='feh --bg-scale'
alias pomo='python spsp.py'
alias ytd='yt-dlp --extract-audio --audio-format mp3'
alias webm_to_mp4='for file in *.webm; do ffmpeg -i "$file" -c:v libx264 -c:a aac -strict experimental -b:a 192k "${file%.we    bm}.mp4"; done'
PS1='[\u@\h \W]\$ '
export $EDITOR "vim"
