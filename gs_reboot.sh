#!/bin/bash

#vars
PASSNEW="youpassforph"
PASSOLD="youpassforph"
PATH2LIST="/tmp/list.txt"

get_ext()
	{
	cat $PATH2LIST
	}
	
get_ext | while read EXT; do
	
IPCH=`asterisk -rx "sip show peers" | grep "OK" | grep "$EXT" | awk '{print $2}'`
#IPPJ=`asterisk -rx "pjsip list contacts" | grep "$EXT" | awk ' {print $2} ' |  sed 's/.*\@//' | sed 's/:.*//'`
echo "Перезагрузка телефона с добавочным номером $EXT и IP адресом $IPCH"
echo "http://$IPCH/cgi-bin/api-sys_operation?passcode=$PASSOLD&request=REBOOT"
curl "http://$IPCH/cgi-bin/api-sys_operation?passcode=$PASSOLD&request=REBOOT"
#echo "http://$IPPJ/cgi-bin/api-sys_operation?passcode=$PASSNEW&request=REBOOT"
#curl "http://$IPPJ/cgi-bin/api-sys_operation?passcode=$PASSNEW&request=REBOOT"
				
done
