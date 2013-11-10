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
alias runscript='~/bin/tempScript.sh'
alias bulkAutocrop='~/bin/bulkAutocrop.sh'
alias bulkDesat='~/bin/bulkDesat.sh'
alias gitup='~/bin/gitup.sh'
alias synergy='synergys --config /etc/synergy.conf'

alias findHackIframe='find ~/public_html -type f \( -name "*.htm" -o -name "*.html" -o -name "*.php" \) -print0 | xargs -0 grep -Hl "base64_decode" > ~/hack_base64.txt && find ~/public_html -type f \( -name "*.htm" -o -name "*.html" -o -name "*.php" \) -print0 | xargs -0 grep -Hl "iframe" > ~/hack_iframe.txt'

alias reload='source ~/.bashrc'
alias dig='~/bin/dig.sh'
alias unpack='~/bin/unpack2dir'
alias sfiles='~/bin/sfiles'
alias subspace='~/bin/subspace'
alias trash='~/bin/trash'
alias fullpaths='~/bin/fullPath.sh'
alias randomPass='~/bin/randomPass.pl'


# -- Custom Functions -- #

command_not_found_handle() { echo E29684E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29684E29690E29688E29684E29684E29684E29684E29688E2968C0D0AE29688E29688E29688E29688E29688E29688E2968CE29684E2968CE29684E29690E29690E2968CE29688E29688E29688E2968CE29680E29680E29688E29688E29680E296800D0AE29688E29688E29688E29688E29684E29688E2968CE29684E2968CE29684E29690E29690E2968CE29680E29688E29688E29688E29684E29684E29688E2968C0D0AE29684E29684E29684E29684E29684E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E29688E296800D0A | xxd -p -r; }

failboat() { echo 202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020205f20205f0d0a20202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202020202027205c2f20270d0a2020205f20205f2020202020202020202020202020202020202020202020203c7c0d0a202020205c2f20202020202020202020202020205f5f275f5f20202020205f5f275f5f2020202020205f5f275f5f0d0a202020202020202020202020202020202020202f202020202f202020202f202020202f20202020202f202020202f0d0a2020202020202020202020202020202020202f5c5f5f5f5f5c202020205c5f5f5f5f5c20202020205c5f5f5f5f5c2020202020202020202020202020205f20205f0d0a20202020202020202020202020202020202f205f5f5f215f5f5f2020205f5f5f215f5f5f202020205f5f5f215f5f5f2020202020202020202020202020205c2f0d0a2020202020202020202020202020202f2f2028202020202020282020282020202020202820202028202020202020280d0a202020202020202020202020202f202f2020205c5f5f5f5f5f5f5c20205c5f5f5f5f5f5f5c2020205c5f5f5f5f5f5f5c0d0a20202020202020202020202f20202f2020205f5f5f5f21
5f5f5f5f5f205f5f5f215f5f5f5f5f5f205f5f5f5f215f5f5f5f5f0d0a2020202020202020202f2020202f2020202f2020202020202020202f2f2020202020202020202f2f2020202020202020202f0d0a2020202020202f202020202f2020207c2020202020202020207c7c2020202020202020207c7c2020202020202020207c0d0a20202020202f5f5f5f5f5f2f20202020205c2020202020202020205c5c2020202020202020205c5c2020202020202020205c0d0a20202020202020202020205c2020202020205c5f5f5f5f5f5f5f5f5f5c5c5f5f5f5f5f5f5f5f5f5c5c5f5f5f5f5f5f5f5f5f5c0d0a2020202020202020202020205c2020202020202020207c202020202020202020207c2020202020202020207c0d0a202020202020202020202020205c5f5f5f5f5f5f5f5f215f5f5f5f5f5f5f5f5f5f215f5f5f5f5f5f5f5f5f215f5f5f5f5f5f5f5f2f0d0a20202020202020202020202020205c7c5f7c5f7c5f7c5f7c5f7c5f4641494c424f41547c5f7c5f7c5f7c5f7c5f7c5f7c5f7c5f2f7c0d0a2020202020202020202020202020205c202020205f5f5f5f5f5f5f5f5f5f5f5f5f5f5f202020202020202020202020202020202f0d0a5e5e5e2525255e255e5e5e255e25255e5c5f222f5f292f5f295f2f5f295f5f292f5f292f292f295f295f225f275f225f2f2f292f292f292f292525255e5e5e255e5e
252525255e0d0a5e21215e5e22212525215e5e5e215e5e5e21215e5e5e2525252525212121215e5e5e25255e5e5e2121252525255e5e5e2121212121212525255e5e5e5e255e5e2525255e5e5e210d0a | xxd -p -r; }

where() { echo ""; whatis "$@"; echo ""; whereis "$@"; echo ""; which "$@"; echo ""; }

numcat() { nl "$@"; echo ""; echo "use 'nl $@' instead of numcat"; }

grepin() { echo "Searching..."; echo ""; find ./ -name \*"$1" -print0 | xargs -0 grep -Hl "$2" ; echo ""; }

whatsmyip() { echo ""; \dig myip.opendns.com @Resolver1.opendns.com +short;echo "";  }

rdns() { echo ""; \dig -x "$@" +short; echo ""; }

rdnslist() { for ip in $(cat "$@";); do echo -e "$ip \t\t $(\dig -x $ip +short;)"; done; }

tldcountry() { echo ""; whois -h whois.iana.org "$@" | grep country | uniq; whois -h whois.iana.org "$@" | grep organisation | uniq; whois -h whois.iana.org "$@" | grep organization | uniq; whois -h whois.iana.org "$@" | grep address | tail -1 | uniq; echo "";  }

searchfor() { find ./ -name \*"$3" -print0 | xargs -0 grep -H "$1" ; echo "(find ./ -name \*$3 -print0 | xargs -0 grep -H $1 ;)"; }

pid() { arg="$@"; echo "COMMAND: ps aux | grep ["${arg:0:1}"]"${arg:1}" | awk '{print \$2 \"\\t\\t\" \$11}'";ps aux | grep [${arg:0:1}]${arg:1} | awk '{print $2 "\t\t" $11}'; }

apache() { sudo /usr/sbin/apache2ctl "$@"; }

fixPerms() { find "$@" -type d -exec chmod -v 755 {} \; ; find "$@" -type f -exec chmod -v 644 {} \; ; find "$@" -name \*.cgi -exec chmod -v 755 {} \; ; find "$@" -name \*.pl -exec chmod -v 755 {} \; ; find "$@" -name \*.pm -exec chmod -v 755 {} \; ; find "$@" -name .ftpquota -exec chmod -v 600 {} \; ; }

wallpaper10() { for i in {1..10};do wget $(wget -O- -U "" "http://images.google.com/images?imgsz=xxlarge&hl=en&q=wallpaper+HD&start=$(($RANDOM%900+100))" --quiet | grep -oe 'http://[^"]*\.jpg' | head -1);done; }

commandlinefu() { echo -e "$(curl -sL http://www.commandlinefu.com/commands/random/json|sed -re 's/.*,"command":"(.*)","summary":"([^"]+).*/\\x1b[1;32m\2\\n\\n\\x1b[1;33m\1\\x1b[0m/g')\n"; }

fileCount() { echo "Total file count: $(find ./ | wc -l) files"; echo "--------------";for d in $(find ./ -maxdepth 1 -type d | grep -v "\./\."); do echo "folder $d has $(find $d | wc -l) file(s)"; done; }

gmail() { curl -u "$@" --silent "https://mail.google.com/mail/feed/atom" | perl -ne 'print "\t" if /<name>/; print "$2\n" if /<(title|name)>(.*)<\/\1>/;';};

meme() { echo -e "\n"; ~/bin/splitmememaker2/mememaker.sh "$@"; echo -e "\n";};

shorten() { echo "recode for tinyurl"; };

alias firefox='/home/therebelrobot/Apps/firefox/firefox'

# RAIN SPECIFIC FUNCTIONS #

function openrain() {
	cd ~/git/rain/"$@";
	git pull;
}
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
alias updateghpages='git checkout gh-pages; git pull origin master; git push origin gh-pages; git checkout master;'
alias copyhash='git rev-parse HEAD | xclip -selection clip; echo -n "copied to clipboard: "; git rev-parse HEAD;'
alias composer='/usr/local/bin/composer.phar'
alias psd2png='/home/therebelrobot/bin/psd2png.sh'
alias pdf2png='/home/therebelrobot/bin/pdf2png.sh'
alias layer2png='/home/therebelrobot/bin/layer2png.sh'
alias push='git push origin $(git rev-parse --abbrev-ref HEAD)'
alias pull='git pull origin $(git rev-parse --abbrev-ref HEAD)'
alias ico2cur='/home/therebelrobot/bin/ico2cur.py'
alias cd..='cd ..'
alias squareup='/home/therebelrobot/bin/squareup'
alias errors='tail -n 20 /var/log/httpd/error_log'
alias rebase='echo "";echo "";echo "git push origin trent-develop --force;";echo "--------------------------------------";git push origin trent-develop --force; echo "";echo "";echo "git pull;";echo "--------------------------------------";git pull; echo "";echo "";echo "git checkout develop;";echo "--------------------------------------";git checkout develop; echo "";echo "";echo "git pull;";echo "--------------------------------------";git pull; 
echo "";echo "";echo "git checkout trent-develop;";echo "--------------------------------------";git checkout trent-develop; echo "";echo "";echo "git rebase develop;";echo "--------------------------------------";git rebase develop; echo "";echo "";echo "git push origin trent-develop --force;";echo "--------------------------------------";git push origin trent-develop --force'
function wiki(){
	str="$@"
	\dig +short txt ${str// /_}.wp.dg.cx
}
alias grabtags='/home/therebelrobot/bin/grabtags.sh'
function ngensite() {
	pushd /etc/nginx/conf/sites-enabled/;
	sudo ln -s /etc/nginx/conf/sites-available/"$@";
	popd;
}
function ngdissite() {
	sudo rm -rf /etc/nginx/conf/sites-available/"$@";
}
function installnodejs() {
	 echo 'export PATH=$HOME/local/bin:$PATH' >> ~/.bashrc;
	. ~/.bashrc;
	mkdir ~/local;
	mkdir ~/node-latest-install;
	cd ~/node-latest-install;
	curl http://nodejs.org/dist/node-latest.tar.gz | tar xz --strip-components=1;
	./configure --prefix=~/local;
	make install;
	curl https://npmjs.org/install.sh | sh;
	node -v;
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

export PATH=$HOME/local/bin:$PATH
export PATH=$HOME/bin:$PATH
