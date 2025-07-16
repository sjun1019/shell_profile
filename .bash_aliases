#bash aliases

alias adbf='adb kill-server && adb -a nodaemon server start'
alias adbc='java -jar ~/platform-tools/adbportforward.jar client adblocation=~/platform-tools remotehost=192.168.0.89'

function usb {
	sudo usbip $1 --remote=192.168.0.87
}

function usbat {
	sudo usbip attach --remote=192.168.0.87 --busid=$1
}


function setenv {
	cd ~/aosp$1 && source ./build/envsetup.sh && lunch aosp_car_arm64-userdebug
}

alias mf='m -j200'
alias ml='m -j32'
alias mm='mm -j200'

function aosp {
	cd ~/aosp$1
}

alias hal='cd ~/broadcast_radio'
alias halr2d='cd ~/broadcast_radio/broadcast_radio_2.0/r2dRadio'

alias gstat='git status'
alias gstash='git stash'
alias gbran='git branch -a'
alias glocal='git branch'
alias glog='git log'
alias gnewb='git checkout -B'
alias greset='git reset --hard'
alias gpull='git pull'
alias gpush='./util/genProjectCode.py ALL && git push'
alias setpall='./util/genProjectCode.py ALL'
alias gcommit='git commit -m'
alias gshow='git show'
alias gpullr2d='cd ~/broadcast_radio/broadcast_radio_2.0/r2dRadio && git pull'
alias gstatr2d='cd ~/broadcast_radio/broadcast_radio_2.0/r2dRadio && git status'
alias glogr2d='cd ~/broadcast_radio/broadcast_radio_2.0/r2dRadio && git log'
alias gbranr2d='cd ~/broadcast_radio/broadcast_radio_2.0/r2dRadio && git branch -a'
alias glocalr2d='cd ~/broadcast_radio/broadcast_radio_2.0/r2dRadio && git branch'
alias gcheckr2d='cd ~/broadcast_radio/broadcast_radio_2.0/r2dRadio && git checkout'
alias gcheck='git checkout'

function gcheckhal {
	cd ~/broadcast_radio && git checkout AOSP_$1_Milestone$2
}

alias getp='cd ~/broadcast_radio && ./get_proj.sh'

function setp {
	./set_env.sh ~/aosp$1 $2
}

function sethidl {
	./set_env_20.sh ~/aosp$1 $2
}

function setaidl {
	./set_env_aidl.sh ~/aosp$1 $2
}

function aidl {
	if (($1)); then
		cd ~/aosp$1/hardware/interfaces/broadcastradio/aidl/default
	else
		cd ./hardware/interfaces/broadcastradio/aidl/default
	fi
}

function hidl {
	if (($1)); then
		cd ~/aosp$1/hardware/interfaces/broadcastradio/2.0/default
	else
		cd ./hardware/interfaces/broadcastradio/2.0/default
	fi
}

function radio {
	if (($1)); then
		cd ~/aosp$1/packages/apps/Car/Radio
	else
		cd ./packages/apps/Car/Radio
	fi
}

alias u='cd ../'
alias uu='cd ../../'
alias uuu='cd ../../../'
alias home='cd ~'

alias vimsh='vim ~/.bash_aliases'
alias resh='source ~/.bash_aliases'
alias install='sudo apt-get install -y'
alias uninstall='sudo apt-get purge -y'

function untar {
	tar -xvf $1 && rm $1
}

function resaidl {
	adb shell am force-stop com.android.car.radio
	sleep 2
		adb shell setprop ctl.stop vendor.broadcastradio-$1
	sleep 2
		adb shell setprop ctl.start vendor.broadcastradio-$1
	sleep 2
	adb shell am start com.android.car.radio
}

function reshidl {
	adb shell am force-stop com.android.car.radio
	sleep 2
		adb shell setprop ctl.stop broadcastradio-$1
	sleep 2
		adb shell setprop ctl.start broadcastradio-$1
	sleep 2
	adb shell am start com.android.car.radio
}

alias stopapp='adb shell am force-stop com.android.car.radio'
alias startapp='adb shell am start com.android.car.radio'

function stopaidl {
	adb shell setprop ctl.stop vendor.broadcastradio-$1
}

function startaidl {
	adb shell setprop ctl.start vendor.broadcastradio-$1
}

function stophidl {
	adb shell setprop ctl.stop broadcastradio-$1
}

function starthidl {
	adb shell setprop ctl.start broadcastradio-$1
}

function stophal {
	if (($2)); then
		adb shell setprop ctl.stop $1.broadcastradio-$2
	else
		adb shell setprop ctl.stop broadcastradio-$1
	fi
}

function starthal {
	if (($2)); then
		adb shell setprop ctl.start $1.broadcastradio-$2
	else
		adb shell setprop ctl.start broadcastradio-$1
	fi
}

function insaidl {
	adb push ~/aosp$1/out/target/product/generic_arm64/vendor/bin/hw/android.hardware.broadcastradio-service.default /vendor/bin/hw/android.hardware.broadcastradio-service.default
}

function inshidl {
	adb push ~/aosp$1/out/target/product/generic_arm64/vendor/bin/hw/android.hardware.broadcastradio@2.0-service /vendor/bin/hw/android.hardware.broadcastradio@2.0-service-$2
}

function insapp {
	adb install ~/aosp$1/out/target/product/generic_arm64/system/priv-app/CarRadioApp/CarRadioApp.apk
}

alias halname='adb shell getprop | grep broadcastradio'
alias halfile='adb shell ls /vendor/bin/hw/ | grep broadcastradio'
alias rmhal='adb shell rm /vendor/bin/hw/*broadcastradio*'

alias aroot='adb root'
alias aremount='adb remount'
alias aremote='adb kill-server && adb -a nodaemon server start'
alias traceh='java -jar ~/AlphaOrionTraceAnalyzer_linux.jar'
alias tracea='java -jar ~/AlphaOrionTraceAnalyzer_aidl.jar'

alias loghidl='adb logcat | grep BcRadioDef'
alias logaidl='adb logcat | grep BcRadioAidlDef'
alias loginfo='adb logcat | grep currProgramInfo'
