
#!/bin/bash -x

#checking flag for available positions
declare -a arr
for (( flag=1 ; flag<=9 ; flag++ ))
do
	arr[$flag]=0
done

declare -a pos
for (( element=1 ; element<=9 ; element++ ))
do
	pos[$element]=$element
done

function board() {
	echo " ${pos[1]} | ${pos[2]} | ${pos[3]}"
	echo "-----------"
	echo " ${pos[4]} | ${pos[5]} | ${pos[6]}"
	echo "-----------"
	echo " ${pos[7]} | ${pos[8]} | ${pos[9]}"
}

random=0
turn_flag=0
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
	read -p "Enter the choice:" position
	pos[$position]=$player
        board
	echo "***********"
        arr[$position]=1
	turn_flag=1
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
	computer_pos=$((RANDOM % 9 + 1))
	pos[$computer_pos]=$computer
        board
	echo "***********"
        arr[$computer_pos]=1
	turn_flag=0
fi
}
toss

