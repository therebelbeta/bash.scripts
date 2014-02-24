#
# ~/.bashrc
#




# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Colors

if [ -f ~/bin/.bash_colors ]; then
      source ~/bin/.bash_colors
fi
if [ -f ~/bash.scripts/.bash_colors ]; then
      source ~/bash.scripts/.bash_colors
fi

#check if SSH'd or sudo'd in
if [ "$DISPLAY" != "" ]; then
   User_Color='\e[0;32m'
else
   if [ "$SSH_CONNECTION" = "" ]; then
     User_Color='\e[1;36m'
   else
     User_Color='\e[1;91m'
   fi
fi

PS1="\[[$Yellow\@\]$Color_Off][$User_Color\H$Color_Off][$User_Color\u$Color_Off] \W \$> "
if [ -f ~/bin/.git-prompt.sh ]; then
      source ~/bin/.git-prompt.sh
      PS1="\[[$Yellow\@\]$Color_Off][$User_Color\H$Color_Off][$User_Color\u$Color_Off] \W$BCyan\$(__git_ps1)$Color_Off \$> "
fi
if [ -f ~/bash.scripts/.git-prompt.sh ]; then
      source ~/bash.scripts/.git-prompt.sh
      PS1="\[[$Yellow\@\]$Color_Off][$User_Color\H$Color_Off][$User_Color\u$Color_Off] \W$BCyan\$(__git_ps1)$Color_Off \$> "
fi


alias reload='echo "reloading ~/.bashrc...";source ~/.bashrc'
alias relaod='echo "reloading ~/.bashrc...";source ~/.bashrc'

# Navigation
alias up='cd ..'
alias home='cd ~/'
alias root='cd /'
alias jump='pushd ~/bin'
alias cd..='cd ..'

# Files and File System
alias ls='ls --color=auto'
alias ll='ls -l'
alias findSymLinks='find ./ -type l'
numcat() { nl "$@"; echo ""; echo "use 'nl $@' instead of numcat"; }
searchfor() { find ./ -name \*"$3" -print0 | xargs -0 grep -H "$1" ; echo "(find ./ -name \*$3 -print0 | xargs -0 grep -H $1 ;)"; }
# Colored up cat!
# You must install Pygments first - "sudo apt-get install python-pygments"
alias c='pygmentize -O style=monokai -f console256 -g'

# System Support
alias stat='stat -c "%U  %a  %y  %n"'
where() { echo ""; whatis "$@"; echo ""; whereis "$@"; echo ""; which "$@"; echo ""; }
pid() { arg="$@"; echo "COMMAND: ps aux | grep ["${arg:0:1}"]"${arg:1}" | awk '{print \$2 \"\\t\\t\" \$11}'";ps aux | grep [${arg:0:1}]${arg:1} | awk '{print $2 "\t\t" $11}'; }
fileCount() { echo "Total file count: $(find ./ | wc -l) files"; echo "--------------";for d in $(find ./ -maxdepth 1 -type d | grep -v "\./\."); do echo "folder $d has $(find $d | wc -l) file(s)"; done; }
bgrun() { echo '----------------' >> ~/nohup.log;date >> ~/nohup.log;	echo '----------------' >> ~/nohup.log; nohup "$@" >> ~/nohup.log & }

# Server Support
alias defaultphpini='cp -pv /etc/php.ini ~/public_html/php.ini.default'
alias findHackIframe='find ~/public_html -type f \( -name "*.htm" -o -name "*.html" -o -name "*.php" \) -print0 | xargs -0 grep -Hl "base64_decode" > ~/hack_base64.txt && find ~/public_html -type f \( -name "*.htm" -o -name "*.html" -o -name "*.php" \) -print0 | xargs -0 grep -Hl "iframe" > ~/hack_iframe.txt'
fixPerms() { find "$@" -type d -exec chmod -v 755 {} \; ; find "$@" -type f -exec chmod -v 644 {} \; ; find "$@" -name \*.cgi -exec chmod -v 755 {} \; ; find "$@" -name \*.pl -exec chmod -v 755 {} \; ; find "$@" -name \*.pm -exec chmod -v 755 {} \; ; find "$@" -name .ftpquota -exec chmod -v 600 {} \; ; }
function restart() {
	if [ "$@" == "server" ] ; then
		echo "sudo /etc/init.d/apache2 restart;"
		sudo /etc/init.d/apache2 restart;
		echo "sudo /etc/init.d/dnsmasq restart;"
		sudo /etc/init.d/dnsmasq restart;
	else
		echo "sudo /etc/init.d/$@ restart;"
		sudo /etc/init.d/"$@" restart;
	fi
}
function starticecast() { sudo /etc/init.d/icecast2 start; ezstream -c "@"mp3.xml; }
alias killnginx='sudo /etc/init.d/nginx stop && sudo /etc/init.d/apache2 start && sudo /etc/init.d/dnsmasq restart'
alias killapache='sudo /etc/init.d/apache2 stop && sudo /etc/init.d/nginx start && sudo /etc/init.d/dnsmasq restart'
ngensite(){
	sudo ln -s /etc/nginx/sites-available/"$@" /etc/nginx/sites-enabled/"$@"
}
ngdissite(){
	sudo unlink /etc/nginx/sites-enabled/"$@"
}
# alias errors='tail -n 20 /var/log/apache2/error.log'
function errors() {
	if [ "$@" ] ; then
		tail -n 20 /var/log/"$@"/error.log
	else
		echo 'Apache';
		tail -n 10 /var/log/apache2/error.log;
		echo '';
		echo 'Nginx';
		tail -n 10 /var/log/nginx/error.log;
		echo '';
	fi
}

# DNS and Network
alias whois-apnic='whois -h whois.apnic.net'
alias whois-ripe='whois -h whois.ripe.net'
alias whois-arin='whois -h whois.arin.net'
alias whois-afrinic='whois -h whois.afrinic.net'
alias whois-lacnic='whois -h whois.lacnic.net'
alias whois-org='whois -h whois.pir.org'
alias whois-edu='whois -h whois.educause.edu'
alias whois-cctld='whois -h whois.iana.org'
alias whois-bgp='whois -h riswhois.ripe.net'
whatsmyip() { echo ""; \dig myip.opendns.com @Resolver1.opendns.com +short;echo "";  }
rdns() { echo ""; \dig -x "$@" +short; echo ""; }
rdnslist() { for ip in $(cat "$@";); do echo -e "$ip \t\t $(\dig -x $ip +short;)"; done; }
tldcountry() { echo ""; whois -h whois.iana.org "$@" | grep country | uniq; whois -h whois.iana.org "$@" | grep organisation | uniq; whois -h whois.iana.org "$@" | grep organization | uniq; whois -h whois.iana.org "$@" | grep address | tail -1 | uniq; echo "";  }

# Git
alias copyhash='git rev-parse HEAD | xclip -selection clip; echo -n "copied to clipboard: "; git rev-parse HEAD;'
alias push='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias pull='git pull'
alias check='git checkout'
alias rebase='git rebase'
alias pull='git pull'
alias sb='git sb'
alias commit='git commit -a'

# Installs
installnodejs()  { sudo apt-get install git curl build-essential libssl-dev; installnvm.sh; reload; nvm install 0.10; nvm use 0.10;}
installnodemods() { npm install gulp -g; npm install bower -g; npm install yeoman -g; npm install nodemon -g; npm install spot -g; }
installsublime() { sudo add-apt-repository ppa:webupd8team/sublime-text-2;	sudo apt-get update; sudo apt-get install sublime-text; }
installlamp() { sudo apt-get install tasksel; sudo tasksel install lamp-server; }
installnetflix() { sudo apt-add-repository ppa:ehoover/compholio; sudo apt-get update; sudo apt-get install netflix-desktop; }
preparesshfs() { CURRENTUSER=$(whoami); sudo apt-get install sshfs; sudo modprobe fuse; sudo adduser $CURRENTUSER fuse; sudo chown root:fuse /dev/fuse; sudo chmod +x /dev/fuse; echo "SSHfs installed."; echo "You will need to logout for these changes to take effect."; }
installicecast(){
	if [ "$@" == "" ] ; then
		echo "please include a directory to place the xml config file: /path/to/place/it/";
	else
		sudo apt-get update; 
		sudo apt-get install icecast2 ices2 ezstream build-essential libshout3-dev libmp3lame-dev ; 
		sudo nano /etc/icecast2/icecast.xml; 
		sudo nano /etc/default/icecast2; 
		cp /usr/share/doc/ezstream/examples/ezstream_mp3.xml "@"mp3.xml; 
		touch "@"playlist.txt; 
		nano "@"mp3.xml; 
		nano "@"playlist.txt; 
	fi
}


# Random Commands
wallpaper10() { for i in {1..10};do wget $(wget -O- -U "" "http://images.google.com/images?imgsz=xxlarge&hl=en&q=wallpaper+HD&start=$(($RANDOM%900+100))" --quiet | grep -oe 'http://[^"]*\.jpg' | head -1);done; }
commandlinefu() { echo -e "$(curl -sL http://www.commandlinefu.com/commands/random/json|sed -re 's/.*,"command":"(.*)","summary":"([^"]+).*/\\x1b[1;32m\2\\n\\n\\x1b[1;33m\1\\x1b[0m/g')\n"; }
wiki() { str="$@"; dig +short txt ${str// /_}.wp.dg.cx; }

# Paths to export
export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/bin/bash:$PATH
export PATH=$HOME/bin/python:$PATH
export PATH=$HOME/.nvm:$PATH


#stuff
alias gonrf='cd ~/git/rain/nrf-com/docroot/sites/all/themes/nrf'