
#!/bin/bash -x

#Use case 1
declare -a pos
for (( element=0 ; element<9 ; element++ ))
do
	pos[$element]=$(($element + 1))
done

function board() {
	echo " ${pos[0]} | ${pos[1]} | ${pos[2]}"
	echo "-----------"
	echo " ${pos[3]} | ${pos[4]} | ${pos[5]}"
	echo "-----------"
	echo " ${pos[6]} | ${pos[7]} | ${pos[8]}"
}
board

#Use case 2
#Use case 3
function toss() {
random=$((RANDOM % 2))
if [ $random -eq 1 ]
then
	echo "Player win the toss"
	read -p "Enter letter X or O:" choice
	if [[ "$choice" == "X" ]]
	then
		player=$choice
		computer="O"
	else
		player=$choice
		computer="X"
	fi
else
	echo "Computer win the toss"
	computer_ch=$((RANDOM % 2))
        if [ $computer_ch -eq 1 ]
	then
		computer="X"
		player="O" 
	else
		computer="O"
		player="X"
	fi
fi
}
toss
echo $player
echo $computer
