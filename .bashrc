#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '

# -- Custom Aliases -- #

alias up='cd ..'
alias home='cd ~/'
alias root='cd /'
alias whois-apnic='whois -h whois.apnic.net'
alias whois-ripe='whois -h whois.ripe.net'
alias whois-arin='whois -h whois.arin.net'
alias whois-afrinic='whois -h whois.afrinic.net'
alias whois-lacnic='whois -h whois.lacnic.net'
alias whois-org='whois -h whois.pir.org'
alias whois-edu='whois -h whois.educause.edu'
alias whois-cctld='whois -h whois.iana.org'
alias whois-bgp='whois -h riswhois.ripe.net'
alias findSymLinks='find ./ -type l'
alias stat='stat -c "%U  %a  %y  %n"'
alias defaultphpini='cp -pv /etc/php.ini ~/public_html/php.ini.default'
alias jump='pushd ~/bin'

alias findHackIframe='find ~/public_html -type f \( -name "*.htm" -o -name "*.html" -o -name "*.php" \) -print0 | xargs -0 grep -Hl "base64_decode" > ~/hack_base64.txt && find ~/public_html -type f \( -name "*.htm" -o -name "*.html" -o -name "*.php" \) -print0 | xargs -0 grep -Hl "iframe" > ~/hack_iframe.txt'

alias reload='echo "reloading ~/.bashrc...";source ~/.bashrc'

# -- Custom Functions -- #

# the FAIL whale
command_not_found_handle() { echo E29684E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29684E29690E29688E29684E29684E29684E29684E29688E2968C0D0AE29688E29688E29688E29688E29688E29688E2968CE29684E2968CE29684E29690E29690E2968CE29688E29688E29688E2968CE29680E29680E29688E29688E29680E296800D0AE29688E29688E29688E29688E29684E29688E2968CE29684E2968CE29684E29690E29690E2968CE29680E29688E29688E29688E29684E29684E29688E2968C0D0AE29684E29684E29684E29684E29684E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E296800D0A | xxd -p -r; }

where() { echo ""; whatis "$@"; echo ""; whereis "$@"; echo ""; which "$@"; echo ""; }

numcat() { nl "$@"; echo ""; echo "use 'nl $@' instead of numcat"; }

whatsmyip() { echo ""; \dig myip.opendns.com @Resolver1.opendns.com +short;echo "";  }

rdns() { echo ""; \dig -x "$@" +short; echo ""; }

rdnslist() { for ip in $(cat "$@";); do echo -e "$ip \t\t $(\dig -x $ip +short;)"; done; }

tldcountry() { echo ""; whois -h whois.iana.org "$@" | grep country | uniq; whois -h whois.iana.org "$@" | grep organisation | uniq; whois -h whois.iana.org "$@" | grep organization | uniq; whois -h whois.iana.org "$@" | grep address | tail -1 | uniq; echo "";  }

searchfor() { find ./ -name \*"$3" -print0 | xargs -0 grep -H "$1" ; echo "(find ./ -name \*$3 -print0 | xargs -0 grep -H $1 ;)"; }

pid() { arg="$@"; echo "COMMAND: ps aux | grep ["${arg:0:1}"]"${arg:1}" | awk '{print \$2 \"\\t\\t\" \$11}'";ps aux | grep [${arg:0:1}]${arg:1} | awk '{print $2 "\t\t" $11}'; }

fixPerms() { find "$@" -type d -exec chmod -v 755 {} \; ; find "$@" -type f -exec chmod -v 644 {} \; ; find "$@" -name \*.cgi -exec chmod -v 755 {} \; ; find "$@" -name \*.pl -exec chmod -v 755 {} \; ; find "$@" -name \*.pm -exec chmod -v 755 {} \; ; find "$@" -name .ftpquota -exec chmod -v 600 {} \; ; }

wallpaper10() { for i in {1..10};do wget $(wget -O- -U "" "http://images.google.com/images?imgsz=xxlarge&hl=en&q=wallpaper+HD&start=$(($RANDOM%900+100))" --quiet | grep -oe 'http://[^"]*\.jpg' | head -1);done; }

commandlinefu() { echo -e "$(curl -sL http://www.commandlinefu.com/commands/random/json|sed -re 's/.*,"command":"(.*)","summary":"([^"]+).*/\\x1b[1;32m\2\\n\\n\\x1b[1;33m\1\\x1b[0m/g')\n"; }

fileCount() { echo "Total file count: $(find ./ | wc -l) files"; echo "--------------";for d in $(find ./ -maxdepth 1 -type d | grep -v "\./\."); do echo "folder $d has $(find $d | wc -l) file(s)"; done; }

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
alias copyhash='git rev-parse HEAD | xclip -selection clip; echo -n "copied to clipboard: "; git rev-parse HEAD;'
alias push='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias pull='git pull'
alias check='git checkout'
alias rebase='git rebase'
alias pull='git pull'
alias sb='git sb'
alias commit='git commit -a'
alias cd..='cd ..'
alias errors='tail -n 20 /var/log/apache2/error.log'
function wiki(){
	str="$@"
	\dig +short txt ${str// /_}.wp.dg.cx
}
function preparenodejs() {
	sudo apt-get install curl make g++;
	echo 'export PATH=$HOME/local/bin:$PATH' >> /etc/bash.bashrc;
	echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc;
	source /etc/bash.bashrc;
	source ~/.bashrc;
	mkdir ~/local;
	mkdir ~/node-latest-install;
}
function installnodejs() {
	cd ~/node-latest-install;
	curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1;
	./configure --prefix=~/local;
	make install;
	curl https://npmjs.org/install.sh | sh;
	cd ~/;
	rm -rf ~/node-latest-install;
}
function installnpmmods() {
	npm install grunt-cli -g
	npm install bower -g
	npm install yeoman -g
	npm install nodemon -g
}
function installsublime() {
	sudo add-apt-repository ppa:webupd8team/sublime-text-2;
	sudo apt-get update;
	sudo apt-get install sublime-text;
}
function installlamp() {
	sudo apt-get install tasksel;
	sudo tasksel install lamp-server;
}
function installnetflix() {
	sudo apt-add-repository ppa:ehoover/compholio;
	sudo apt-get update;
	sudo apt-get install netflix-desktop;
}
function preparesshfs() {
	CURRENTUSER=$(whoami);
	sudo apt-get install sshfs;
	sudo modprobe fuse;
	sudo adduser $CURRENTUSER fuse;
	sudo chown root:fuse /dev/fuse;
	sudo chmod +x /dev/fuse;
	echo "SSHfs installed."
	echo "You will need to logout for these changes to take effect.";
}
alias killnginx='sudo /etc/init.d/nginx stop && sudo /etc/init.d/apache2 start && sudo /etc/init.d/dnsmasq restart'

export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/bin:$PATH