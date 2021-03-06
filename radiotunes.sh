#!/bin/bash
#

URL=http://www.radiotunes.com/
HOST=pub1.radiotunes.com

HDRHST="Host: $HOST"
HDRREF="Referer: $URL"
HDRUA="User-Agent: Mozilla/5.0"

IFS=$','
CHS="quit,00srnb,60srock,80sdance,80srock,90srnb,altrock,ambient,americansongbook,baroque,bebop,bossanova,cafedeparis,chillout,christian,classicalperiod,classicalpianotrios,classical,classicmotown,classicrap,classicrock,clubbollywood,country,dancehits,datempolounge,davekoz,discoparty,downtempolounge,dreamscapes,edmfest,eurodance,guitar,hardrock,hit60s,hit70s,hit90s,indierock,jazzclassics,jpop,lounge,lovemusic,meditation,mellowjazz,mellowsmoothjazz,metal,modernblues,modernrock,mozart,nature,newage,oldies,oldschoolfunknsoul,pianojazz,poprock,reggaeton,relaxation,relaxingambientpiano,romantica,romantic,rootsreggae,salsa,slowjams,smoothbossanova,smoothjazz247,smoothjazz,smoothlounge,softrock,solopiano,soundtracks,the80s,tophits,uptemposmoothjazz,urbanjamz,urbanpophits,vocalchillout,vocallounge,vocalnewage,vocalsmoothjazz,world"
EXT=".pls"

select ch in $CHS; do
	if [ $ch = "quit" ]; then
	    exit
	fi

	curl -H $HDRHST -H $HDRREF$ch -H $HDRUA \
	     http://$HOST/radiotunes_"$ch"_aacplus?type=.flv -v | mplayer -
done
