
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

#Print board
function board() {
	echo " ${pos[1]} | ${pos[2]} | ${pos[3]}"
	echo "-----------"
	echo " ${pos[4]} | ${pos[5]} | ${pos[6]}"
	echo "-----------"
	echo " ${pos[7]} | ${pos[8]} | ${pos[9]}"
}

#Toss and choose letters
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
	echo "           "
	echo "           "
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
	computer_pos=$(((RANDOM % 9) + 1))
	pos[$computer_pos]=$computer
        board
	echo "           "
	echo "           "
        arr[$computer_pos]=1
	turn_flag=0
	val=$computer
fi
}
toss

#Creating winning hints for the player
function win_move() {
        if ([[ "${pos[2]}" == "$player" ]] && [[ "${pos[3]}" == "$player" ]] && [[ "${pos[1]}" != "$computer" ]]) ||
	   ([[ "${pos[4]}" == "$player" ]] && [[ "${pos[7]}" == "$player" ]] && [[ "${pos[1]}" != "$computer" ]]) ||
	   ([[ "${pos[5]}" == "$player" ]] && [[ "${pos[9]}" == "$player" ]] && [[ "${pos[1]}" != "$computer" ]])
        then
             echo "choose 1 for win..."
        elif ([[ "${pos[5]}" == "$player" ]] && [[ "${pos[8]}" == "$player" ]] && [[ "${pos[2]}" != "$computer" ]]) ||
	     ([[ "${pos[1]}" == "$player" ]] && [[ "${pos[3]}" == "$player" ]] && [[ "${pos[2]}" != "$computer" ]])
		then
			echo "choose 2 for win..."
		elif ([[ "${pos[1]}" == "$player" ]] && [[ "${pos[2]}" == "$player" ]] && [[ "${pos[3]}" != "$computer" ]]) ||
	             ([[ "${pos[5]}" == "$player" ]] && [[ "${pos[7]}" == "$player" ]] && [[ "${pos[3]}" != "$computer" ]]) ||
        	     ([[ "${pos[6]}" == "$player" ]] && [[ "${pos[9]}" == "$player" ]] && [[ "${pos[3]}" != "$computer" ]])
			then
				echo "choose 3 for win..."
			elif ([[ "${pos[5]}" == "$player" ]] && [[ "${pos[6]}" == "$player" ]] && [[ "${pos[4]}" != "$computer" ]]) ||
			     ([[ "${pos[1]}" == "$player" ]] && [[ "${pos[7]}" == "$player" ]] && [[ "${pos[4]}" != "$computer" ]])
        			then
					echo "choose 4 for win..."
				elif ([[ "${pos[1]}" == "$player" ]] && [[ "${pos[9]}" == "$player" ]] && [[ "${pos[5]}" != "$computer" ]]) ||
                     		     ([[ "${pos[2]}" == "$player" ]] && [[ "${pos[8]}" == "$player" ]] && [[ "${pos[5]}" != "$computer" ]]) ||
                     		     ([[ "${pos[3]}" == "$player" ]] && [[ "${pos[7]}" == "$player" ]] && [[ "${pos[5]}" != "$computer" ]]) ||
				     ([[ "${pos[4]}" == "$player" ]] && [[ "${pos[6]}" == "$player" ]] && [[ "${pos[5]}" != "$computer" ]])
					then
						echo "choose 5 for win..."
					elif ([[ "${pos[4]}" == "$player" ]] && [[ "${pos[5]}" == "$player" ]] && [[ "${pos[6]}" != "$computer" ]]) ||
					     ([[ "${pos[3]}" == "$player" ]] && [[ "${pos[9]}" == "$player" ]] && [[ "${pos[6]}" != "$computer" ]])
						then
							echo "choose 6 for win..."
						elif ([[ "${pos[1]}" == "$player" ]] && [[ "${pos[4]}" == "$player" ]] && [[ "${pos[7]}" != "$computer" ]]) ||
                   				     ([[ "${pos[5]}" == "$player" ]] && [[ "${pos[3]}" == "$player" ]] && [[ "${pos[7]}" != "$computer" ]]) ||
                  				     ([[ "${pos[8]}" == "$player" ]] && [[ "${pos[9]}" == "$player" ]] && [[ "${pos[7]}" != "$computer" ]])
							then
								echo "choose 7 for win..."
							elif ([[ "${pos[2]}" == "$player" ]] && [[ "${pos[5]}" == "$player" ]] && [[ "${pos[8]}" != "$computer" ]]) ||
							     ([[ "${pos[7]}" == "$player" ]] && [[ "${pos[9]}" == "$player" ]] && [[ "${pos[8]}" != "$computer" ]])
								then
									echo "choose 8 for win..."
								elif ([[ "${pos[1]}" == "$player" ]] && [[ "${pos[5]}" == "$player" ]] && [[ "${pos[9]}" != "$computer" ]]) ||
                                                    		     ([[ "${pos[7]}" == "$player" ]] && [[ "${pos[8]}" == "$player" ]] && [[ "${pos[9]}" != "$computer" ]]) ||
                                                 		     ([[ "${pos[3]}" == "$player" ]] && [[ "${pos[6]}" == "$player" ]] && [[ "${pos[9]}" != "$computer" ]])
									then
										echo "choose 9 for win..."
	fi
}

#Creating blocking computer winning hints for the player
function win_block() {
        if ([[ "${pos[2]}" == "$computer" ]] && [[ "${pos[3]}" == "$computer" ]] && [[ "${pos[1]}" != "$player" ]]) ||
	   ([[ "${pos[4]}" == "$computer" ]] && [[ "${pos[7]}" == "$computer" ]] && [[ "${pos[1]}" != "$player" ]]) ||
	   ([[ "${pos[5]}" == "$computer" ]] && [[ "${pos[9]}" == "$computer" ]] && [[ "${pos[1]}" != "$player" ]])
        then
             echo "choose 1 for block..."
        elif ([[ "${pos[5]}" == "$computer" ]] && [[ "${pos[8]}" == "$computer" ]] && [[ "${pos[2]}" != "$player" ]]) ||
	     ([[ "${pos[1]}" == "$computer" ]] && [[ "${pos[3]}" == "$computer" ]] && [[ "${pos[2]}" != "$player" ]])
		then
			echo "choose 2 for block..."
		elif ([[ "${pos[1]}" == "$computer" ]] && [[ "${pos[2]}" == "$computer" ]] && [[ "${pos[3]}" != "$player" ]]) ||
	             ([[ "${pos[5]}" == "$computer" ]] && [[ "${pos[7]}" == "$computer" ]] && [[ "${pos[3]}" != "$player" ]]) ||
        	     ([[ "${pos[6]}" == "$computer" ]] && [[ "${pos[9]}" == "$computer" ]] && [[ "${pos[3]}" != "$player" ]])
			then
				echo "choose 3 for block..."
			elif ([[ "${pos[5]}" == "$computer" ]] && [[ "${pos[6]}" == "$computer" ]] && [[ "${pos[4]}" != "$player" ]]) ||
			     ([[ "${pos[1]}" == "$computer" ]] && [[ "${pos[7]}" == "$computer" ]] && [[ "${pos[4]}" != "$player" ]])
        			then
					echo "choose 4 for block..."
				elif ([[ "${pos[1]}" == "$computer" ]] && [[ "${pos[9]}" == "$computer" ]] && [[ "${pos[5]}" != "$player" ]]) ||
                     		     ([[ "${pos[2]}" == "$computer" ]] && [[ "${pos[8]}" == "$computer" ]] && [[ "${pos[5]}" != "$player" ]]) ||
                     		     ([[ "${pos[3]}" == "$computer" ]] && [[ "${pos[7]}" == "$computer" ]] && [[ "${pos[5]}" != "$player" ]]) ||
				     ([[ "${pos[4]}" == "$computer" ]] && [[ "${pos[6]}" == "$computer" ]] && [[ "${pos[5]}" != "$player" ]])
					then
						echo "choose 5 for block..."
					elif ([[ "${pos[4]}" == "$computer" ]] && [[ "${pos[5]}" == "$computer" ]] && [[ "${pos[6]}" != "$player" ]]) ||
					     ([[ "${pos[3]}" == "$computer" ]] && [[ "${pos[9]}" == "$computer" ]] && [[ "${pos[6]}" != "$player" ]])
						then
							echo "choose 6 for block..."
						elif ([[ "${pos[1]}" == "$computer" ]] && [[ "${pos[4]}" == "$computer" ]] && [[ "${pos[7]}" != "$player" ]]) ||
                   				     ([[ "${pos[5]}" == "$computer" ]] && [[ "${pos[3]}" == "$computer" ]] && [[ "${pos[7]}" != "$player" ]]) ||
                  				     ([[ "${pos[8]}" == "$computer" ]] && [[ "${pos[9]}" == "$computer" ]] && [[ "${pos[7]}" != "$player" ]])
							then
								echo "choose 7 for block..."
							elif ([[ "${pos[2]}" == "$computer" ]] && [[ "${pos[5]}" == "$computer" ]] && [[ "${pos[8]}" != "$player" ]]) ||
							     ([[ "${pos[7]}" == "$computer" ]] && [[ "${pos[9]}" == "$computer" ]] && [[ "${pos[8]}" != "$player" ]])
								then
									echo "choose 8 for block..."
								elif ([[ "${pos[1]}" == "$computer" ]] && [[ "${pos[5]}" == "$computer" ]] && [[ "${pos[9]}" != "$player" ]]) ||
                                                    		     ([[ "${pos[7]}" == "$computer" ]] && [[ "${pos[8]}" == "$computer" ]] && [[ "${pos[9]}" != "$player" ]]) ||
                                                 		     ([[ "${pos[3]}" == "$computer" ]] && [[ "${pos[6]}" == "$computer" ]] && [[ "${pos[9]}" != "$player" ]])
									then
										echo "choose 9 for block..."
	fi
}


#Wining Conditions
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
			exit
		else
			echo "Computer wins..."
			exit
		fi
	fi
}

#Play function
count=0
while [ $count -lt 9 ]
do
	if [ $turn_flag -eq 0 ]
	then
		turn_flag=1
		read -p "Enter the choice:" position
		if [ ${arr[$position]} -eq 0 ]
		then
			pos[$position]=$player
			board
			val=$player
			win_block
			win_move
			win
			echo "           "
			echo "           "
                	arr[$position]=1
		else
			while [ ${arr[$position]} -ne 0 ]
			do
				read -p "Enter the choice:" position
				pos[$position]=$player
				board
				val=$player
				win_block
				win_move
				win
				echo "           "
				echo "           "
				arr[$position]=1
			done
		fi
	else
		turn_flag=0
		computer_pos=$(((RANDOM % 9) + 1))
		if [ ${arr[$computer_pos]} -eq 0 ]
        	then
			pos[$computer_pos]=$computer
			board
			val=$computer
			win_block
			win_move
			win
			echo "           "
			echo "           "
			arr[$computer_pos]=1
		else
			while [ ${arr[$computer_pos]} -ne 0 ] 
                	do
				computer_pos=$(((RANDOM % 9) + 1))
			done
				pos[$computer_pos]=$computer
                		board
				val=$computer
				win_block
				win_move
				win
		       		echo "           "
				echo "           "
				arr[$computer_pos]=1
		fi
	fi
	count=$(($count + 1))
#Available corners
	if [ $count -gt 5 ]
	then
		if [ ${arr[1]} -eq 0 ]
		then
			echo "Corner 1 avaiable"
		elif [ ${arr[3]} -eq 0 ]
			then
				echo "Corner 3 avaiable"
			elif [ ${arr[7]} -eq 0 ]
				then
					echo "Corner 7 avaiable"
				elif [ ${arr[9]} -eq 0 ]
					then
						echo "Cormer 9 avaiable"
				fi
		fi
	if [ $count -eq 8 ]
	then
		echo "Draw..."
		exit
	fi
done

