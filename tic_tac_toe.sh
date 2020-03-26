
#!/bin/bash -x

#Use case 1
declare -a pos
for (( i=0 ; i<9 ; i++ ))
do
	pos[$i]=$(($i + 1))
done

function board() {
	echo " ${pos[0]} | ${pos[1]} | ${pos[2]}"
	echo "-----------"
	echo " ${pos[3]} | ${pos[4]} | ${pos[5]}"
	echo "-----------"
	echo " ${pos[6]} | ${pos[7]} | ${pos[8]}"
}
board
