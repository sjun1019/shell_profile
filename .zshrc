prompt='%F{099}%n%f%F{220}@%f%F{049}%m%f %F{196}%1~%f %F{220}%#%f '
alias ls='ls -G'
alias ll='ls -G -alF'
alias la='ls -G -A'
alias l='ls -G'
alias u='cd ../'
alias uu='cd ../../'
alias uuu='cd ../../../'
alias home='cd ~'

export PATH="$PATH:/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home/bin:/Users/lsj/platform-tools:/usr/local/Cellar/curl/8.12.0/bin"
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home"
export HOMEBREW_FORCE_BREWED_CURL=1

set -o vi

alias adbc='java -jar ~/adbportforward.jar client adblocation=/Users/lsj/platform-tools remotehost=192.168.0.88'
alias adbf='java -jar ~/adbportforward.jar server adblocation=/Users/lsj/platform-tools'
alias zsh='vim ~/.zshrc'
alias resh='source ~/.zshrc'
alias adev='adb devices'
alias root='adb root'
alias remount='adb remount'
alias joseph='ssh joseph@192.168.0.88 -X -Y'

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
	adb push ~/aosp$1/out/target/product/generic_arm64/vendor/bin/hw/android.hardware.broadcastradio@2.0-service /vendor/bin/hw/android.hardware.broadcastradio@2.0-service-
}

function insapp {
	adb install ~/aosp$1/out/target/product/generic_arm64/system/priv-app/CarRadioApp/CarRadioApp.apk
}

alias halname='adb shell getprop | grep broadcastradio'
alias halfile='adb shell ls /vendor/bin/hw/ | grep broadcastradio'
alias root='adb root'
alias remount='adb remount'
alias remoteadb='adb kill-server && adb -a nodaemon server start'
alias traceh='java -jar ~/AlphaOrionTraceAnalyzer_linux.jar'
alias tracea='java -jar ~/AlphaOrionTraceAnalyzer_aidl.jar'

#export ADB_SERVER_SOCKET=tcp:192.168.0.88:5037
#alias scrcpy='scrcpy --tunnel-host=192.168.0.88'
