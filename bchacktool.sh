#!/bin/bash

###############
# debian reis #
###############

#Colors
    cyan='\e[0;36m'
    lightcyan='\e[96m'
    lightgreen='\e[1;32m'
    white='\e[1;37m'
    red='\e[1;31m'
    yellow='\e[1;33m'
    blue='\e[1;34m'
    tp='\e[0m'
    green='\e[0;32m'

# variables
    blink='\e[5m'
    setdir=$PWD
    version='bchacktool V2.0'

if [[ $USER = "root" ]] ; then
    echo "ok" &> /dev/null
else
    echo -e "$red sudo ./bchacktool.sh${tp} ile deneyiniz"
    exit 1
fi

# help
if [[ $1 =~ ^(-h|--help|-y|--yardım) ]] ; then
    echo ""
    echo -e "Default kullanım için dosyayı ${lightgreen}./bchacktool-lite.sh$tp"
    echo -e "${green}./bchacktool-lite.sh -u$tp Otomatik Güncelleyici"
    echo "----------------------------------------------------------"
    echo -e $cyan"    Create by           $white":" $red ByChan$tp"
    echo -e $cyan"    Youtube Kanalim     $white":" $red https://www.youtube.com/ByChan$tp"
    echo -e $cyan"    Github              $white":" $red https://github.com/ByCh4n$tp"
    echo -e $cyan"    Instagram           $white":" $red @huseyinaltns$tp"
    echo -e "$cyan    Discord            $white : $red https://discord.gg/R6vApmn$tp"
    echo -e "$cyan    Tester             $white : $red CruelMSA$tp"
    echo -e "$cyan    developper         $white : $red https://github.com/lastpingu$tp"
    exit 0
elif [[ $1 =~ ^(-u|--update|-g|--güncelle) ]] ; then
    checkupdatepermission=$(ls -l update | awk '{print $1}') 
    if [[ $checkupdatepermission = "-rwxr-x--x" ]] ; then
    bash update
    else
    chmod 751 update
    bash update
    fi
    exit 0
elif [[ $1 =~ ^(-v|--version) ]] ; then
    echo "$version"
fi

# spinner
spinlong ()
{
    bar=" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    barlength=${#bar}
    i=0
    while ((i < 100)); do
        n=$((i*barlength / 100))
        printf "\e[00;32m\r[%-${barlength}s]\e[00m" "${bar:0:n}"
        ((i += RANDOM%5+2))
        sleep 0.02
    done
    echo -e "[${green}OK${tp}]"
}

function pressanykey {
    read -n 1 -r -s -p $'Press any key to continue...\n'
}

function pressanykey3 {
    read -t 3 -n 1 -r -s -p $'Press any key to continue...\n'
}

function ok {
    echo "ok" &> /dev/null
}

# banner
function banner {
    randomnumb=$((1 + RANDOM % 10))
    if [[ $randomnumb = "1" ]] ; then
        cat banners/banner1 | $lc
    elif [[ $randomnumb = "2" ]] ; then
        cat banners/banner2 | $lc
    elif [[ $randomnumb = "3" ]] ; then
        cat banners/banner3 | $lc   
    elif [[ $randomnumb = "4" ]] ; then
        cat banners/banner4 | $lc
    elif [[ $randomnumb = "5" ]] ; then
        cat banners/banner5 | $lc
    elif [[ $randomnumb = "6" ]] ; then
        cat banners/banner6 | $lc
    elif [[ $randomnumb = "7" ]] ; then
        cat banners/banner7 | $lc
    elif [[ $randomnumb = "8" ]] ; then
        cat banners/banner8 | $lc                   
    elif [[ $randomnumb = "9" ]] ; then
        cat banners/banner9 | $lc
    else
        cat banners/banner | $lc
    fi
}

# detect ctrl+c exiting
trap ctrl_c INT
ctrl_c() {
echo -e "\n"
echo -e "[${blink}${yellow}*${tp}]$red (Ctrl + C ) Tespit Edildi Cikiliyor...$tp"
echo -e "[${blink}${yellow}*${tp}]$blue BCHackTool Programini Tercih Ettiginiz Icin Tesekkurler  {ByChan} :)$tp"
exit 0
}

## CHECK ##

# check internet 
function checkinternet {
  ping -c 1 google.com > /dev/null
  if [[ "$?" != 0 ]]
  then
    echo -e " Internet Kontrol Ediliyor...: ${red}BAGLANAMADI$tp \n Bu Programin Etkin Bir Internete Ihtiyaci Var"
    echo "Simdi Çıkılıyor"
    exit 1
  else
    echo "Interet Kontrol Ediliyor: BAGLANDI"
    sleep 0.7
  fi
}
# check gali linaksss
checkkali=$(uname -r)
if [[ $checkkali = *kali* ]] ; then
    if [[ -d kalisources ]] ; then
        ok
    else
        echo "Kali Linux İşletim Sistemi Bulundu Otomatik Güncelleyici İndiriliyor."
        git clone https://github.com/lastpingu/kalisources.git &> /dev/null
        spinlong
        cd kalisources &> /dev/null
        chmod +x kalisources &> /dev/null
        ./kalisources
    fi
fi

# ruby check
checkruby=$(which ruby)
if [[ $checkruby = "" ]] ; then
    echo "ruby kuruluyor"
    apt install ruby -y &> /dev/null
    spinlong
fi
# check lolcat
checklolcat=$(lolcat -v | awk '{print $1}')
if [[ $checklolcat = "" ]] ; then
	echo "lolcat kuruluyor"
	gem install lolcat &> /dev/null
	spinlong
fi

# varlolcat
if [[ -f /usr/local/bin/lolcat ]] ; then
	lc='/usr/local/bin/lolcat' 
elif [[ -f /usr/games/lolcat ]] ; then
	lc='/usr/games/lolcat'
else
echo "lolcat yüklenirken hata oldu manuel olarak kurunuz: "
fi

## check piton

#python
checkpython=$(which python)
if [[ $checkpython = "" ]] ; then
    echo "python kuruluyor"
    apt install -y python python-pip &> /dev/null
    spinlong
fi

#python2
checkpython2=$(which python2)
if [[ $checkpython2 = "" ]] ; then
    echo "python kuruluyor"
    apt install -y python2 python2-pip &> /dev/null
    spinlong
fi

#python3
checkpython3=$(which python3)
if [[ $checkpython3 = "" ]] ; then
    echo "python kuruluyor"
    apt install -y python3 python3-pip &> /dev/null
    spinlong
fi
#-# The real script real #-#
checkinternet
while :
do
clear
cd $setdir
banner
echo ""
echo -e "${blink}${lightgreen}  ---------------------------------------------------------$tp"
echo -e "${blink}${lightgreen}  |$tp ${cyan}Create by           $white":" $red ByChan$tp ${blink}${lightgreen}                        |$tp"
echo -e "${blink}${lightgreen}  |$tp ${cyan}Youtube Kanalim     $white":" $red https://www.youtube.com/ByChan$tp ${blink}${lightgreen}|$tp"
echo -e "${blink}${lightgreen}  |$tp ${cyan}Github              $white":" $red https://github.com/ByCh4n$tp ${blink}${lightgreen}     |$tp"
echo -e "${blink}${lightgreen}  |$tp ${cyan}Instagram           $white":" $red huseyinaltns$tp ${blink}${lightgreen}                  |$tp"
echo -e "${blink}${lightgreen}  ---------------------------------------------------------$tp\n"
echo "  ~~~~~~~~~~~~~~~~~~~~~ BcHackTool ~~~~~~~~~~~~~~~~~~~~~~~~~" | $lc
        echo ""
        echo " [1] ✔ Inshackle             [2] ✔ Kickthemout" | $lc
        echo " [3] ✔ Torghost              [4] ✔ HiddenEye" | $lc
        echo " [5] ✔ ByChan-Ddos           [6] ✔ Userrecon" | $lc
        echo " [7] ✔ Seeker                [8] ✔ Instashell" | $lc
        echo " [9] ✔ BluForceFB            [10] ✔ Cupp" | $lc
        echo " [11] ✔ SpamWa               [12] ✔ RZP" | $lc
		echo " [13] ✔ Ip-Tracer            [14] ✔ OSIF" | $lc
		echo " [15] ✔ Bruter19             [16] ✔ CamHackers" | $lc
		echo " [17] ✔ TheFatRat            [18] ✔ PhoneInfoga" | $lc
        echo " [19] ✔ RequiredChan" | $lc
        echo " [q] ✔ Çıkış                 [h] ✔ Araçlar Hakkında Bilgi Ve Kullanım" | $lc
        echo ""
        echo -ne "❨${red}BCHackTool@ByCh4n${tp}❩:(${blue}./BCHackTool${tp})\n↳[${blink}${lightcyan}*${tp}]➢ " ; read option
        
        case "$option" in 
            1)
            if [[ -d inshackle ]] ; then
                ok
            else
                clear
                cat banners/bcbanner  
                echo -e $red "~~~~~~~~~~~~~~~ Inshackle İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/Sanju8943/inshackle > /dev/null 2>&1
                spinlong
                echo -e $red " ~~~~~~~~~~~ Inshackle İndirildi ~~~~~~~~~~~$tp"
                cd inshackle
                chmod +x inshackle.sh
                cd ..
                pressanykey3
            fi
            clear
            cd inshackle
            ./inshackle.sh
            cd ..
                ;;
            2) 
            if [[ -d kickthemout ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner
                echo -e $red "~~~~~~~~~~~~~~~ Kickthemout İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/k4m4/kickthemout > /dev/null 2>&1
                spinlong
                cd kickthemout
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                apt-get install -y nmap
                apt-get install -y python3               
                apt-get install -y python3-pip             
                pip3 install -r requirements.txt              
                chmod +x kickthemout.py
                } &> /dev/null
                spinlong
                cd ..
                echo -e "$red  ~~~~~~~~~~~ Kickthemout Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            clear
            cd kickthemout
            python3 kickthemout.py
            cd ..
                ;;
            3) 
            if [[ -d torghost ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner
                echo -e $red "~~~~~~~~~~~~~~~ Torghost İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/SusmithKrishnan/torghost > /dev/null 2>&1
                spinlong
                cd torghost
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                chmod +x install.sh
                ./install.sh
                } &> /dev/null
                spinlong
                echo -e "$red  ~~~~~~~~~~~ Torghost Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            clear
            cd torghost # adet yerini bulsun
            torghost -s
            cd .. # adet yerini buldu
                ;;
            4)
             if [[ -d HiddenEye ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner  
                echo -e $red "~~~~~~~~~~~~~~~ HiddenEye İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/DarkSecDevelopers/HiddenEye > /dev/null 2>&1
                spinlong
                cd HiddenEye
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
	            pip3 install -r requirements.txt
			    apt-get install -y php
			    pip install php
                } &> /dev/null
                spinlong
                echo -e "$red  ~~~~~~~~~~~ HiddenEye Kuruldu ~~~~~~~~~~~~$tp"
                cd ..
                pressanykey3
            fi
            clear
            cd HiddenEye
            python3 HiddenEye.py
            cd ..
                ;;
            5)
            if [[ -d Ddos-Attack-ByChan ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner  
                echo -e $red "~~~~~~~~~~~~~~~ ByChan-Ddos İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/ByCh4n/Ddos-Attack-ByChan > /dev/null 2>&1
                spinlong
                cd Ddos-Attack-ByChan
                chmod +x Ddos.py
                echo -e "$red  ~~~~~~~~~~~ ByChan-Ddos Kuruldu ~~~~~~~~~~~~$tp"
                cd ..
                pressanykey3
            fi
            clear
            cd Ddos-Attack-ByChan
            python Ddos.py
            cd ..
                ;;
            6)
            if [[ -d userrecon ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner  
                echo -e $red "~~~~~~~~~~~~~~~ Userrecon İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/issamelferkh/userrecon > /dev/null 2>&1
                spinlong
                cd userrecon
                chmod +x userrecon.sh
                echo -e "$red  ~~~~~~~~~~~ Userrecon Kuruldu ~~~~~~~~~~~~$tp"
                cd ..
                pressanykey3
            fi
            clear
            cd userrecon
            ./userrecon.sh
            cd ..
                ;;
            7)
            if [[ -d seeker ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner  
                echo -e $red "~~~~~~~~~~~~~~~ Seeker İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/thewhiteh4t/seeker > /dev/null 2>&1
                spinlong
                cd seeker
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                sudo chmod +x install.sh
                sudo chmod +x seeker.py
                ./install.sh
                apt-get install -y python3
                } &> /dev/null
                spinlong
                echo -e "$red  ~~~~~~~~~~~ Seeker Kuruldu ~~~~~~~~~~~~$tp"
                cd ..
                pressanykey3
            fi
            clear
            cd seeker
            python3 seeker.py -t manual -k OlPuna
            cd ..    
                ;;
            8)
            if [[ -d instashell ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "~~~~~~~~~~~~~~~ Instashell İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/OffXec/instashell > /dev/null 2>&1
                spinlong
                cd instashell
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                chmod +x instashell.sh
                chmod +x install.sh
                clear
                sudo ./install.sh
                clear
                service tor start
                } &> /dev/null
                spinlong
                echo -e "$red  ~~~~~~~~~~~ Instashell Kuruldu ~~~~~~~~~~~~$tp"
                cd ..
                pressanykey3
            fi
            clear
            cd instashell
            ./instashell.sh
            cd ..
                ;;
	        9)
            if [[ -d BluForce-FB ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "~~~~~~~~~~~~~~~ BluForce-FB İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/AngelSecurityTeam/BluForce-FB > /dev/null 2>&1
                spinlong
                cd BluForce-FB
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                chmod +x bluforcefb.py
                apt-get install -y python2
                apt-get install -y python-pip
                pip2 install mechanize
                } &> /dev/null
                spinlong
                echo -e "$red  ~~~~~~~~~~~ BluForce-FB Kuruldu ~~~~~~~~~~~~$tp"
                cd ..
                pressanykey3
            fi
            clear
            cd BluForce-FB
            sudo python2 bluforcefb.py
            cd ..
                ;;
	        10)
            if [[ -d cupp ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner  
                echo -e $red "~~~~~~~~~~~~~~~ Cupp İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/Mebus/cupp > /dev/null 2>&1
                spinlong
                cd cupp
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                chmod +x cup.py
                apt-get install -y python3
                } &> /dev/null
                spinlong
                echo -e "$red  ~~~~~~~~~~~ Cupp Kuruldu ~~~~~~~~~~~~$tp"
                cd ..
                pressanykey3
            fi
            clear
            cd cupp
            sudo python3 cupp.py -i
            cd ..
                ;;
	        11)
            if [[ -d SpamWa ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner 
                echo -e $red "~~~~~~~~~~~~~~~ SpamWa İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/sandiwijayani1/SpamWa > /dev/null 2>&1
                spinlong
                cd SpamWa
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                chmod +x spam.py
                apt-get install -y python3
                pip3 install requests
                sudo python3 spam.py
                } &> /dev/null
                spinlong
                cd ..
                echo -e "$red  ~~~~~~~~~~~ SpamWa Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            clear
            cd SpamWa
            sudo python3 spam.py
            cd ..
                ;;
	        12)
            if [[ -d Rar-Zip-Crack ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "~~~~~~~~~~~~~~~ Rar-Zip-Crack İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/ByCh4n/Rar-Zip-Crack > /dev/null 2>&1
                spinlong
                cd Rar_Zip_Cracker
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                chmod +x rar_zip_cracker.py
                apt-get install -y python3
                python3 rar_zip_cracker.py
                } &> /dev/null
                spinlong
                cd ..
                echo -e "$red  ~~~~~~~~~~~ Rar-Zip-Crack Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            clear
            cd Rar_Zip_Cracker
            sudo python3 rar_zip_cracker.py
            cd ..
                ;;
		    13)
            if [[ -d IP-Tracer ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner  
                echo -e $red "~~~~~~~~~~~~~~~ IP-Tracer İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/rajkumardusad/IP-Tracer > /dev/null 2>&1
                spinlong
                cd IP-Tracer
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                chmod +x install
                ./install
                } &> /dev/null
                spinlong
                cd ..
                echo -e "$red  ~~~~~~~~~~~ IP-Tracer Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            clear
            cd Ip-Tracer
            ip-tracer start
            cd ..
                ;;
		    14)
            if [[ -d OSIF ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "~~~~~~~~~~~~~~~ OSIF İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/CiKu370/OSIF > /dev/null 2>&1
                spinlong
                cd OSIF
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                pip2 install -r requirements.txt
                } &> /dev/null
                spinlong
                cd ..
                echo -e "$red  ~~~~~~~~~~~ OSIF Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            clear
            cd OSIF
            python2 osif.py
            cd ..
                ;;
		    15)
            if [[ -d Bruter19 ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "~~~~~~~~~~~~~~~ Bruter19 ~~~~~~~~~~~~~~~"
                git clone https://github.com/AzizKpln/Bruter19 > /dev/null 2>&1
                spinlong
                cd Bruter19
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
				apt-get install -y python-pip
                ./setup.sh
                } &> /dev/null
                spinlong
                cd ..
                echo -e "$red  ~~~~~~~~~~~ Bruter19 Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            clear
            cd Bruter19
            sudo python3 bruter19.py
            cd ..
                ;;
		    16)
            if [[ -d Cam-Hackers ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "~~~~~~~~~~~~~~~ Cam-Hackers ~~~~~~~~~~~~~~~"
                git clone https://github.com/AngelSecurityTeam/Cam-Hackers > /dev/null 2>&1
                spinlong
                cd Cam-Hackers
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                apt-get install -y python3-pip
                pip3 install requests
                } &> /dev/null
                spinlong
                cd ..
                echo -e "$red  ~~~~~~~~~~~ Cam-Hackers Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            clear
            cd Cam-Hackers
            sudo python3 cam-hackers.py
            cd ..
                ;;
		    17)
            if [[ -d TheFatRat ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "~~~~~~~~~~~~~~~ TheFatRat İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/Screetsec/TheFatRat > /dev/null 2>&1
                spinlong
                cd TheFatRat
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                apt-get install -y default-jdk
                chmod +x setup.sh
				./setup.sh
                } #&> /dev/null
                spinlong
                cd ..
                echo -e "$red  ~~~~~~~~~~~ TheFatRat Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            clear
            pwd
            cd TheFatRat
            pwd
            ./fatrat
            sleep 15
            cd ..
                ;;
            18)
            if [[ -d PhoneInfoga ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner     
                echo -e $red "~~~~~~~~~~~~~~~ PhoneInfoga İndiriliyor ~~~~~~~~~~~~~~~"
                git clone https://github.com/Wes974/PhoneInfoga > /dev/null 2>&1
                spinlong
                cd PhoneInfoga
                echo -e "$red  ~~~~~~~~~~~ Ek Bileşenler Kuruluyor ~~~~~~~~~~~~$tp"
                {
                sudo apt-get install -y python
                sudo apt-get install -y python-pip
                pip install -r requirements.txt
                } &> /dev/null
                spinlong
                cd ..
                echo -e "$red  ~~~~~~~~~~~ PhoneInfoga Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            while :; do
                echo -e "1-) ${green}[TR +${red}90${green}]${tp} +90 yazmadan ${blue}5312534783${tp} şeklinde giriniz"
                echo -e "2-) ${blue}custom ülke koduyla birlikte + dan sonrasını yazarak +${blue}994${green}4980335$tp"
                echo -e "b-) Ana Menü"
                echo -ne "\n${red}┌─[${tp}PhoneInfoga${yellow}@${blue}BCHackTool${red}]─[${green}./bchacktool.sh/PhoneInfoga${red}] \n└──╼${yellow}$ ${tp}" ; read input1
                if [[ $input1 = "1" ]] ; then
                echo -e "${green}[TR +${red}90${green}]${tp} +90 yazmadan ${blue}5312534783${tp} şeklinde giriniz"
                echo -ne "\n${red}┌─[${tp}PhoneInfoga${yellow}@${blue}BCHackTool${red}]─[${green}./bchacktool.sh/PhoneInfoga/TR${red}] \n└──╼${yellow}$ ${tp}" ; read atkx
                    python3 phoneinfoga.py -n +90${atkx}
                elif [[ $input1 = "2" ]] ; then
                echo -e "${blue}custom$tp ülke koduyla birlikte ${lightgreen}+${tp} dan sonrasını yazarak +${blue}994${green}4980335$tp"
                echo -ne "\n${red}┌─[${tp}PhoneInfoga${yellow}@${blue}BCHackTool${red}]─[${green}./bchacktool.sh/PhoneInfoga/custom${red}] \n└──╼${yellow}$ ${tp}" ; read atkx
                    python3 phoneinfoga.py -n +${atkx}
                elif [[ $input1 =~ ^(b|B|g|G|GERI|GERİ|geri|BACK|back) ]] ; then
                    break
                else
                    echo "Ne Dediğini Anlayamadım"
                fi
            done
                ;;
            19)
            if [[ -d RequiredChan ]] ; then
                ok
            else 
                clear
                cat banners/bcbanner   
                echo -e $red "~~~~~~~~~~~~~~~ RequiredChan İndirildi ~~~~~~~~~~~~~~~"
                git clone https://github.com/ByCh4n/RequiredChan > /dev/null 2>&1
                spinlong
                cd RequiredChan
                echo -e "$red  ~~~~~~~~~~~ PhoneInfoga Kuruldu ~~~~~~~~~~~~$tp"
                pressanykey3
            fi
            clear
            cd RequiredChan
            chmod +x reqchan
            ./reqchan
            cd ..
                ;;
            h)
                clear
                echo -e "1 : Açıklama  : Inshackle Otomatik Takipçi Gönderme Programıdır\nKullanımı : 2 Seçeneğe Basıp Kullanıcı Adı Şifre Girerek Takipçilerinizi Gönderebilirsiniz.\nYapımcı   : Thelinuxchoice\n"
                echo -e "2 : Açıklama  : Kickthemout Wifi Ağınızdaki Kişileri Kicklemek Yani (Atmak) Amacıyla kullanılmaktadır .\nKullanımı : 1. Seçenek Tek Bir Kişiyi Seçip Atar 2. Seçenek Birkaç Kişi 3. Herkesi Atar .\nYapımcı   : k4m4\n"
                echo -e "3 : Açıklama  : Torghost Programı Kendi Sabit Ipnizi Sürekli Olarak Değiştirerek Bir Nevi Anonim Olmanızı Sağlar .\nKullanımı : Terminale torghost -s Derseniz Çalıştırmış Olacaksınız torghost -x Derseniz Duracaktır .\nYapımcı   : SusmithKrishnan\n"
                echo -e "4 : Açıklama  : HiddenEye Programı Sosyal Mühendislik Yani Phishin (Oltalama) Taktiği Diyebiliriz Sahte Sayfa Görüntüsü Denilebilir .\nKullanımı : Karşınıza Çıkan Seçeneklerden İstediğinizi Seçip Servis Olarakta ngrok Seçmeniz Önerilir .\nYapımcı   : DarkSecDevelopers\n"
                echo -e "5 : Açıklama  : Ddos Programı Hepimizin Bildiği Gibi Kendi İnternetimizi Kullanarak Karşı Tarafa Paket Saldırısı Yapmaktır .\nKullanımı : Hedef Ip Adresini Ve Portu Yazdığınızda Saldırı Başlayacaktır. Not : Evdeki İnternetlerinizle Yaparsanız Karşı Taraf Gıdıklanır . :)\nYapımcı   : ByChan\n"
                echo -e "6 : Açıklama  : UserRecon Programı Kişi Analizi Programıdır Yani Her Bir Sosyal Medya Üzerinden Yazdığınız Nicki Taratır Ve Sonuçları Karşınıza Getirir .\nKullanımı : Karşınıza Çıkan Kısımda Herhangi bir Kullanıcı Adını Yazınız Yani Karşı Tarafa Yönelik İstediğiniz Bir Nick Diyebiliriz .\nYapımcı   : Thelinuxchoice\n"
                echo -e "7 : Açıklama  : Seeker Programı OSINT Aracıdır Yani Bilgi Toplayıcı .\nKullanımı : Kullanım Olarak Birşey Yapmanıza Gerek Kalmaz Sadece Sağlayıcı Olarak Ngrok Seçiniz .\nYapımcı   : Thewhiteh4t"
                echo -e "8 : Açıklama  : Instashell Programı Instagram Brute Force Yani Kaba Kuvvet Saldırısı İçin Kullanılan Bir Araçtır (Fixli).\nKullanımı : UserName Account Olarak Hangi Kişiye Uygulanacaksa Onu Gireceksiniz Wordlist Olarak Kendi Oluşturduğunuz Wordlisti Gireceksiniz Threads Olan Yere "20" Yazarsan Oldu Bu İş .\nYapımcı   : Thelinuxchoice\n"
                echo -e "9 : Açıklama  : BluForceFB Programı Facebook İçin Hazırlanmış Kaba Kuvvet Saldırısıdır.\nKullanımı : Email Kısmına Karşı Tarafın Email Adresini Gireceksiniz Ve Oluşturduğunuz Wordlisti Girdikten Sonra İşlem Tamam. :)\nYapımcı   : AngelSecurityTeam\n"
                echo -e "10 : Açıklama  : Cupp Programı BruteForce Sistemlerinde İstenen Wordlist Oluşturma Programıdır .\nKullanımı : Karşınıza Çıkan Kısımda Kim İçin Wordlisti Oluşturacaksanız Onun Bilgilerini Gireceksiniz.\nYapımcı   : Mebus\n"
                echo -e "11 : Açıklama  : SpamWa Programı Karşı Tarafın Telefon Bilgisi Girildikten Sonra Whatsapptan Saçma Sapan Sağlayıcılardan Sms Atar.\nKullanımı : Karşına Gelen Kısımda Bir Sağlayıcı Seçiceksin Tokopedia Olabilir Ve Sonrasında Numara Gireceksin Oldu Bile . :)\nYapımcı   : Unknown\n"
                echo -e "12 : Açıklama  : Rar-Zip-Cracker Aracı İsminden de Anlaşılacağı Gibi Rar Zip Şifre Kırıcı Programıdır . (John Desteği İle Çalışır)\nKullanımı : Karşınıza Çıkan Menuden Rar Zip İkisinden Birini Belirtiniz Ve Dosyayı Belirtiniz İşlem Tamam . :)\nYapımcı   : Ahmet Birkan\n"
                echo -e "13 : Açıklama  : Ip-Tracer Programı Karşı Tarafın Ipsini Öğrendikten Sonra Karşınıza Birkaç Ip Hakkında Bilgi Çıkartır .\nKullanımı : Karşınıza Çıkan Menüden 1. Seçeneği Seçiniz Ve İp Adresini Giriniz Ve Karşında Bilgiler . :)\nYapımcı   : rajkumardusad\n"
                echo -e "14 : Açıklama  : OSIF Programı Facebook Sitesinin Açığını Kullanarak Yapılan Bir Programdır Facebook Arkadaşlarınızın Email Ve Telefon Numaralarını Öğrenebilirsiniz Bu Program Sayesinde.\nKullanımı : Karşınıza Gelen Kısıma token Yazarak Sizden İstenilen Email Ve Şifrenizi Giriniz (Facebook) Girdikten Sonra dump_mail Yazarsanız Sizin Facebook Hesabınızda Ekli Olan Kişilerin Email Hesaplarını dumo_phone Yazarsanız Ekli Olan Kişilerin Telefon Numaralarını Elde Edersiniz. :)\nYapımcı   : Ciku370\n"
                echo -e "15 : Açıklama  : Bruter19 Programı Facebook,Twitter,Instagram BruteForce Yani Kaba Kuvvet Saldırısı Yapan Bir Araçtır.\nKullanımı : Karşınıza Çıkan Menüden İlerlerseniz Herşeyi Yaparsınız . :)\nYapımcı   : AzizKpln\n"
                echo -e "16 : Açıklama  : Cam-Hackers Programı Şifresi Bulunmayan Admin Paneli Bulunmayan Açık Olan Güvenlik Kameralarına Sızmak İçin Kullanılan Bir Araçtır.\nKullanımı : Karşınıza Çıkan Bir Kısımda İstediğiniz Bir Ülkeyi Seçiniz Ardından Çıkan Ip Adreslerinden Birini Tarayıcıda Aratınız Ve Kamera Karşınızda . :)\nYapımcı   : AngelSecurityTeam\n"
                echo -e "17 : Açıklama  : TheFatRat Programı Trojan Backdoor Oluşturmak İçin Kullanılan Sağlam Bir Programdır .\nKullanımı : Karşınıza Çıkan Menüden İstediğinizi Seçerek Yolunuza Bakın. :)\nYapımcı   : Screetsec\n"
                echo -e "18 : Açıklama  : PhoneInfoga Programı Telefon Numarasından Bilgi Toplama Aracıdır .\nKullanımı : Karşınıza Çıkan Menüde İstediğiniz Ülke Kodunu Seçiniz Ve Numarayı Giriniz Sonuçlar Karşınızda. :)\nYapımcı   : Wes974\n"
                echo -e "19 : Açıklama  : RequiredChan Programı Sizin İçin Kali Linux Ve Termux Sistemlerine Gerekli Olan Programları Kurar Ve Kali Linux İçin Otomatik Depo Günceller .\nKullanımı : Karşınıza Çıkan Menüde Kali Linux Kullanıyorsanız 2. Seçenek Sonra 1. Seçenek Termux Kullanıyorsanız 1. Seçeneği Seçip Bekleyiniz.\nYapımcı   : ByChan\n"
                pressanykey
                ;;
            q)
                clear
                cat banners/bcbanner
                echo " BCHackTool Programini Tercih Ettiginiz Icin Tesekkurler {ByChan} !!" | $lc
                echo ""
                exit 0
                ;;
        esac
done
