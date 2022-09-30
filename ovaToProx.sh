###############################################
#
#  Input needed the name of the ova 
#  the location where to copy it 
#
################################################
#!/bin/bash
#check there is an inputs for the script
if [ $# -eq 0 ]
  then
	echo ''
	echo " Arguments needed <name of OVA> <location of empty vm>"
	echo''
	echo " example mrRobot /mnt/pve/Local-All/images/103/ " 
	echo " There could be error since the name of the file will not work"
	echo " Rename the file at the final desitnation"

	echo ""
	echo " TODO: you might not have to conver since i saw vmdk as a disk option "
	exit 0
fi
# Creat directory to store each ova 
# change it to a variable $(ovaName) 
# mkdir $(ovaName)
OVANAME=$1
echo $OVANAME
mkdir $OVANAME/
printf "\t decompresing\n"
tar -xf $OVANAME.ova -C $OVANAME
#tar -xf mrRobot.ova -C mrRobot

cd $OVANAME/

# conver to the correct format 
echo "** converting **"
qemu-img convert -f vmdk $(pwd)/$OVANAME/$OVANAME-disk1.vmdk -O qcow2 $(pwd)/$OVANAME/$OVANAME-disk1.qcow2
echo "done converin"

#qemu-img convert -f vmdk $(pwd)/mrRoobot/mrRobot-disk1.vmdk -O qcow2 $(pwd)/mrRobot/mrRobot-disk1.qcow2
#copy to the correct location

mv $OVANAME/$OVANAME.qcow2 $2


#mv mrRobot.qcow2 /mnt/pve/Local-All/images/103/** 
