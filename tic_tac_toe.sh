
#!/bin/bash -x

#checking flag for available positions
turn_flag=0
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
	val=$player
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
	val=$computer
fi
}
toss

function win() {
	if ([[ "${pos[1]}" == "$val" ]] && [[ "${pos[2]}" == "$val" ]] && [[ "${pos[3]}" == "$val" ]]) ||
	   ([[ "${pos[4]}" == "$val" ]] && [[ "${pos[5]}" == "$val" ]] && [[ "${pos[6]}" == "$val" ]]) ||
	   ([[ "${pos[7]}" == "$val" ]] && [[ "${pos[8]}" == "$val" ]] && [[ "${pos[9]}" == "$val" ]]) ||
	   ([[ "${pos[1]}" == "$val" ]] && [[ "${pos[4]}" == "$val" ]] && [[ "${pos[7]}" == "$val" ]]) ||
	   ([[ "${pos[2]}" == "$val" ]] && [[ "${pos[5]}" == "$val" ]] && [[ "${pos[8]}" == "$val" ]]) ||
	   ([[ "${pos[3]}" == "$val" ]] && [[ "${pos[6]}" == "$val" ]] && [[ "${pos[9]}" == "$val" ]]) ||
	   ([[ "${pos[1]}" == "$val" ]] && [[ "${pos[5]}" == "$val" ]] && [[ "${pos[9]}" == "$val" ]]) ||
	   ([[ "${pos[3]}" == "$val" ]] && [[ "${pos[5]}" == "$val" ]] && [[ "${pos[7]}" == "$val" ]]) 
	then
		if [[ "$val" == "$player" ]]
		then
			echo "Player wins..."
		else
			echo "Computer wins..."
		fi
	fi
	exit
}
win
