#!/bin/bash
PASSWORD=$(gpg -d -q ~/.config/annke.gpg)
CAM_ADDR=192.168.111.23
CURL="curl -o /dev/null -s -u "admin:$PASSWORD" --digest --location --request PUT "http://$CAM_ADDR/ISAPI/PTZCtrl/channels/1/relative"  --header 'Content-Type: application/xml'"

function left {
	$CURL --data-raw '<PTZData>
	    <Relative>
	    <positionX>128</positionX>
	    <positionY>64</positionY>
	    <relativeZoom>0</relativeZoom>
	    </Relative>
	    </PTZData>
	    '
}

function right {
	$CURL --data-raw '<PTZData>
	    <Relative>
	    <positionX>128</positionX>
	    <positionY>192</positionY>
	    <relativeZoom>0</relativeZoom>
	    </Relative>
	    </PTZData>
	    '
}

function up {
	$CURL --data-raw '<PTZData>
	    <Relative>
	    <positionX>200</positionX>
	    <positionY>128</positionY>
	    <relativeZoom>0</relativeZoom>
	    </Relative>
	    </PTZData>
	    '
}

function down {
	$CURL --data-raw '<PTZData>
	    <Relative>
	    <positionX>100</positionX>
	    <positionY>128</positionY>
	    <relativeZoom>0</relativeZoom>
	    </Relative>
	    </PTZData>
	    '
}

function plus {
	$CURL --data-raw '<PTZData>
	    <Relative>
	    <positionX>128</positionX>
	    <positionY>128</positionY>
	    <relativeZoom>100</relativeZoom>
	    </Relative>
	    </PTZData>
	    '
}

function minus {
	$CURL --data-raw '<PTZData>
	    <Relative>
	    <positionX>128</positionX>
	    <positionY>128</positionY>
	    <relativeZoom>-100</relativeZoom>
	    </Relative>
	    </PTZData>
	    '
}

while [ "$mode" != "q" ]; do
	escape_char=$(printf "\u1b")
	read -rsn1 mode
	if [[ $mode == $escape_char ]]; then
	    read -rsn2 mode # read 2 more chars
	fi
	case $mode in
	    'q') echo QUITTING ; exit ;;
	    '[A') up ;;
	    '[B') down ;;
	    '[D') left ;;
	    '[C') right ;;
	    '+') plus ;;
	    '-') minus ;;
	esac
done
