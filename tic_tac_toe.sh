
#!/bin/bash -x

#checking FLAG for available POSITIONs
TURN_FLAG=0
declare -a ARR
for (( FLAG=1 ; FLAG<=9 ; FLAG++ ))
do
	ARR[$FLAG]=0
done

declare -a POS
for (( ELEMENT=1 ; ELEMENT<=9 ; ELEMENT++ ))
do
	POS[$ELEMENT]=$ELEMENT
done

#Print board
function Board() {
	echo " ${POS[1]} | ${POS[2]} | ${POS[3]}"
	echo "-----------"
	echo " ${POS[4]} | ${POS[5]} | ${POS[6]}"
	echo "-----------"
	echo " ${POS[7]} | ${POS[8]} | ${POS[9]}"
}

#Toss and choose letters
function Toss() {
TOSS=$((TOSS % 2))
if [ $TOSS -eq 1 ]
then
	echo "PLAYER win the toss"
	read -p "Enter letter X or O:" CHOICE
	if [[ "$CHOICE" == "X" ]] 
	then
		PLAYER=$CHOICE
		COMPUTER="O"
	else
		PLAYER=$CHOICE
		COMPUTER="X"
	fi
	read -p "Enter the CHOICE:" POSITION
	POS[$POSITION]=$PLAYER
        board
	echo "           "
	echo "           "
        ARR[$POSITION]=1
	TURN_FLAG=1
	VAL=$PLAYER
else
	echo "COMPUTER win the toss"
	COMPUTER_ch=$((TOSS % 2))
        if [ $COMPUTER_ch -eq 1 ]
	then
		COMPUTER="X"
		PLAYER="O" 
	else
		COMPUTER="O"
		PLAYER="X"
	fi
	COMPUTER_POS=$(((TOSS % 9) + 1))
	echo "COMPUTER choose $COMPUTER_POS"
	POS[$COMPUTER_POS]=$COMPUTER
        board
	echo "           "
	echo "           "
        ARR[$COMPUTER_POS]=1
	TURN_FLAG=0
	VAL=$COMPUTER
fi
}

#Creating winning hints for the PLAYER
function Win_move() {
        if ([[ "${POS[2]}" == "$PLAYER" ]] && [[ "${POS[3]}" == "$PLAYER" ]] && [ ${ARR[1]} -eq 0 ]) ||
	   ([[ "${POS[4]}" == "$PLAYER" ]] && [[ "${POS[7]}" == "$PLAYER" ]] && [ ${ARR[1]} -eq 0 ]) ||
	   ([[ "${POS[5]}" == "$PLAYER" ]] && [[ "${POS[9]}" == "$PLAYER" ]] && [ ${ARR[1]} -eq 0 ])
        then
             echo "choose 1 for win..."
        elif ([[ "${POS[5]}" == "$PLAYER" ]] && [[ "${POS[8]}" == "$PLAYER" ]] && [ ${ARR[2]} -eq 0 ]) ||
	     ([[ "${POS[1]}" == "$PLAYER" ]] && [[ "${POS[3]}" == "$PLAYER" ]] && [ ${ARR[2]} -eq 0 ])
		then
			echo "choose 2 for win..."
		elif ([[ "${POS[1]}" == "$PLAYER" ]] && [[ "${POS[2]}" == "$PLAYER" ]] && [ ${ARR[3]} -eq 0 ]) ||
	             ([[ "${POS[5]}" == "$PLAYER" ]] && [[ "${POS[7]}" == "$PLAYER" ]] && [ ${ARR[3]} -eq 0 ]) ||
        	     ([[ "${POS[6]}" == "$PLAYER" ]] && [[ "${POS[9]}" == "$PLAYER" ]] && [ ${ARR[3]} -eq 0 ])
			then
				echo "choose 3 for win..."
			elif ([[ "${POS[5]}" == "$PLAYER" ]] && [[ "${POS[6]}" == "$PLAYER" ]] && [ ${ARR[4]} -eq 0 ]) ||
			     ([[ "${POS[1]}" == "$PLAYER" ]] && [[ "${POS[7]}" == "$PLAYER" ]] && [ ${ARR[4]} -eq 0 ])
        			then
					echo "choose 4 for win..."
				elif ([[ "${POS[1]}" == "$PLAYER" ]] && [[ "${POS[9]}" == "$PLAYER" ]] && [ ${ARR[5]} -eq 0 ]) ||
                     		     ([[ "${POS[2]}" == "$PLAYER" ]] && [[ "${POS[8]}" == "$PLAYER" ]] && [ ${ARR[5]} -eq 0 ]) ||
                     		     ([[ "${POS[3]}" == "$PLAYER" ]] && [[ "${POS[7]}" == "$PLAYER" ]] && [ ${ARR[5]} -eq 0 ]) ||
				     ([[ "${POS[4]}" == "$PLAYER" ]] && [[ "${POS[6]}" == "$PLAYER" ]] && [ ${ARR[5]} -eq 0 ])
					then
						echo "choose 5 for win..."
					elif ([[ "${POS[4]}" == "$PLAYER" ]] && [[ "${POS[5]}" == "$PLAYER" ]] && [ ${ARR[6]} -eq 0 ]) ||
					     ([[ "${POS[3]}" == "$PLAYER" ]] && [[ "${POS[9]}" == "$PLAYER" ]] && [ ${ARR[6]} -eq 0 ])
						then
							echo "choose 6 for win..."
						elif ([[ "${POS[1]}" == "$PLAYER" ]] && [[ "${POS[4]}" == "$PLAYER" ]] && [ ${ARR[7]} -eq 0 ]) ||
                   				     ([[ "${POS[5]}" == "$PLAYER" ]] && [[ "${POS[3]}" == "$PLAYER" ]] && [ ${ARR[7]} -eq 0 ]) ||
                  				     ([[ "${POS[8]}" == "$PLAYER" ]] && [[ "${POS[9]}" == "$PLAYER" ]] && [ ${ARR[7]} -eq 0 ])
							then
								echo "choose 7 for win..."
							elif ([[ "${POS[2]}" == "$PLAYER" ]] && [[ "${POS[5]}" == "$PLAYER" ]] && [ ${ARR[8]} -eq 0 ]) ||
							     ([[ "${POS[7]}" == "$PLAYER" ]] && [[ "${POS[9]}" == "$PLAYER" ]] && [ ${ARR[8]} -eq 0 ])
								then
									echo "choose 8 for win..."
								elif ([[ "${POS[1]}" == "$PLAYER" ]] && [[ "${POS[5]}" == "$PLAYER" ]] && [ ${ARR[9]} -eq 0 ]) ||
                                                    		     ([[ "${POS[7]}" == "$PLAYER" ]] && [[ "${POS[8]}" == "$PLAYER" ]] && [ ${ARR[9]} -eq 0 ]) ||
                                                 		     ([[ "${POS[3]}" == "$PLAYER" ]] && [[ "${POS[6]}" == "$PLAYER" ]] && [ ${ARR[9]} -eq 0 ])
									then
										echo "choose 9 for win..."
	fi
}

#Creating blocking COMPUTER winning hints for the PLAYER
function Win_block() {
        if ([[ "${POS[2]}" == "$COMPUTER" ]] && [[ "${POS[3]}" == "$COMPUTER" ]] && [ ${ARR[1]} -eq 0 ]) ||
	   ([[ "${POS[4]}" == "$COMPUTER" ]] && [[ "${POS[7]}" == "$COMPUTER" ]] && [ ${ARR[1]} -eq 0 ]) ||
	   ([[ "${POS[5]}" == "$COMPUTER" ]] && [[ "${POS[9]}" == "$COMPUTER" ]] && [ ${ARR[1]} -eq 0 ])
        then
             echo "choose 1 for block..."
        elif ([[ "${POS[5]}" == "$COMPUTER" ]] && [[ "${POS[8]}" == "$COMPUTER" ]] && [ ${ARR[2]} -eq 0 ]) ||
	     ([[ "${POS[1]}" == "$COMPUTER" ]] && [[ "${POS[3]}" == "$COMPUTER" ]] && [ ${ARR[2]} -eq 0 ])
		then
			echo "choose 2 for block..."
		elif ([[ "${POS[1]}" == "$COMPUTER" ]] && [[ "${POS[2]}" == "$COMPUTER" ]] && [ ${ARR[3]} -eq 0 ]) ||
	             ([[ "${POS[5]}" == "$COMPUTER" ]] && [[ "${POS[7]}" == "$COMPUTER" ]] && [ ${ARR[3]} -eq 0 ]) ||
        	     ([[ "${POS[6]}" == "$COMPUTER" ]] && [[ "${POS[9]}" == "$COMPUTER" ]] && [ ${ARR[3]} -eq 0 ])
			then
				echo "choose 3 for block..."
			elif ([[ "${POS[5]}" == "$COMPUTER" ]] && [[ "${POS[6]}" == "$COMPUTER" ]] && [ ${ARR[4]} -eq 0 ]) ||
			     ([[ "${POS[1]}" == "$COMPUTER" ]] && [[ "${POS[7]}" == "$COMPUTER" ]] && [ ${ARR[4]} -eq 0 ])
        			then
					echo "choose 4 for block..."
				elif ([[ "${POS[1]}" == "$COMPUTER" ]] && [[ "${POS[9]}" == "$COMPUTER" ]] && [ ${ARR[5]} -eq 0 ]) ||
                     		     ([[ "${POS[2]}" == "$COMPUTER" ]] && [[ "${POS[8]}" == "$COMPUTER" ]] && [ ${ARR[5]} -eq 0 ]) ||
                     		     ([[ "${POS[3]}" == "$COMPUTER" ]] && [[ "${POS[7]}" == "$COMPUTER" ]] && [ ${ARR[5]} -eq 0 ]) ||
				     ([[ "${POS[4]}" == "$COMPUTER" ]] && [[ "${POS[6]}" == "$COMPUTER" ]] && [ ${ARR[5]} -eq 0 ])
					then
						echo "choose 5 for block..."
					elif ([[ "${POS[4]}" == "$COMPUTER" ]] && [[ "${POS[5]}" == "$COMPUTER" ]] && [ ${ARR[6]} -eq 0 ]) ||
					     ([[ "${POS[3]}" == "$COMPUTER" ]] && [[ "${POS[9]}" == "$COMPUTER" ]] && [ ${ARR[6]} -eq 0 ])
						then
							echo "choose 6 for block..."
						elif ([[ "${POS[1]}" == "$COMPUTER" ]] && [[ "${POS[4]}" == "$COMPUTER" ]] && [ ${ARR[7]} -eq 0 ]) ||
                   				     ([[ "${POS[5]}" == "$COMPUTER" ]] && [[ "${POS[3]}" == "$COMPUTER" ]] && [ ${ARR[7]} -eq 0 ]) ||
                  				     ([[ "${POS[8]}" == "$COMPUTER" ]] && [[ "${POS[9]}" == "$COMPUTER" ]] && [ ${ARR[7]} -eq 0 ])
							then
								echo "choose 7 for block..."
							elif ([[ "${POS[2]}" == "$COMPUTER" ]] && [[ "${POS[5]}" == "$COMPUTER" ]] && [ ${ARR[8]} -eq 0 ]) ||
							     ([[ "${POS[7]}" == "$COMPUTER" ]] && [[ "${POS[9]}" == "$COMPUTER" ]] && [ ${ARR[8]} -eq 0 ])
								then
									echo "choose 8 for block..."
								elif ([[ "${POS[1]}" == "$COMPUTER" ]] && [[ "${POS[5]}" == "$COMPUTER" ]] && [ ${ARR[9]} -eq 0 ]) ||
                                                   		     ([[ "${POS[7]}" == "$COMPUTER" ]] && [[ "${POS[8]}" == "$COMPUTER" ]] && [ ${ARR[9]} -eq 0 ]) ||
                                                 		     ([[ "${POS[3]}" == "$COMPUTER" ]] && [[ "${POS[6]}" == "$COMPUTER" ]] && [ ${ARR[9]} -eq 0 ])
									then
										echo "choose 9 for block..."
	fi
}


#Wining Conditions
function Win() {
	if ([[ "${POS[1]}" == "$VAL" ]] && [[ "${POS[2]}" == "$VAL" ]] && [[ "${POS[3]}" == "$VAL" ]]) ||
	   ([[ "${POS[4]}" == "$VAL" ]] && [[ "${POS[5]}" == "$VAL" ]] && [[ "${POS[6]}" == "$VAL" ]]) ||
	   ([[ "${POS[7]}" == "$VAL" ]] && [[ "${POS[8]}" == "$VAL" ]] && [[ "${POS[9]}" == "$VAL" ]]) ||
	   ([[ "${POS[1]}" == "$VAL" ]] && [[ "${POS[4]}" == "$VAL" ]] && [[ "${POS[7]}" == "$VAL" ]]) ||
	   ([[ "${POS[2]}" == "$VAL" ]] && [[ "${POS[5]}" == "$VAL" ]] && [[ "${POS[8]}" == "$VAL" ]]) ||
	   ([[ "${POS[3]}" == "$VAL" ]] && [[ "${POS[6]}" == "$VAL" ]] && [[ "${POS[9]}" == "$VAL" ]]) ||
	   ([[ "${POS[1]}" == "$VAL" ]] && [[ "${POS[5]}" == "$VAL" ]] && [[ "${POS[9]}" == "$VAL" ]]) ||
	   ([[ "${POS[3]}" == "$VAL" ]] && [[ "${POS[5]}" == "$VAL" ]] && [[ "${POS[7]}" == "$VAL" ]]) 
	then
		if [[ "$VAL" == "$PLAYER" ]]
		then
			echo "PLAYER wins..."
			exit
		else
			echo "COMPUTER wins..."
			exit
		fi
	fi
}

#Play function
Toss
COUNT=0
while [ $COUNT -lt 9 ]
do
	if [ $TURN_FLAG -eq 0 ]
	then
		TURN_FLAG=1
		read -p "Enter the CHOICE:" POSITION
		if [ ${ARR[$POSITION]} -eq 0 ]
		then
			POS[$POSITION]=$PLAYER
			VAL=$PLAYER
			Win_move
			Win_block
			Board
			Win
			echo "           "
			echo "           "
                	ARR[$POSITION]=1
		else
			while [ ${ARR[$POSITION]} -ne 0 ]
			do
				read -p "Enter the CHOICE:" POSITION
				POS[$POSITION]=$PLAYER
				VAL=$PLAYER
				Win_move
				Win_block
				Board
				Win
				echo "           "
				echo "           "
				ARR[$POSITION]=1
			done
		fi
	else
		TURN_FLAG=0
		COMPUTER_POS=$(((TOSS % 9) + 1))
		if [ ${ARR[$COMPUTER_POS]} -eq 0 ]
        	then
			echo "COMPUTER choose $COMPUTER_POS"
			POS[$COMPUTER_POS]=$COMPUTER
			VAL=$COMPUTER
			Win_move
			Win_block
			Board
			Win
			echo "           "
			echo "           "
			ARR[$COMPUTER_POS]=1
		else
			while [ ${ARR[$COMPUTER_POS]} -ne 0 ] 
                	do
				COMPUTER_POS=$(((TOSS % 9) + 1))
			done
				echo "COMPUTER choose $COMPUTER_POS"
				POS[$COMPUTER_POS]=$COMPUTER
				VAL=$COMPUTER
				Win_move
				Win_block
				Board
				Win
		       		echo "           "
				echo "           "
				ARR[$COMPUTER_POS]=1
		fi
	fi
#Available corners
	if [ $COUNT -gt 5 ]
	then
		if [ ${ARR[1]} -eq 0 ]
		then
			echo "Corner 1 avaiable"
		elif [ ${ARR[3]} -eq 0 ]
			then
				echo "Corner 3 avaiable"
			elif [ ${ARR[7]} -eq 0 ]
				then
					echo "Corner 7 avaiable"
				elif [ ${ARR[9]} -eq 0 ]
					then
						echo "Corner 9 avaiable"
#Checking center available or not
					elif [ ${ARR[5]} -eq 0 ]
						then
							echo "Center 5 avaiable"
#Checking side available or not
						elif [ ${ARR[2]} -eq 0 ]
							then
								echo "Side 2 available"
							elif [ ${ARR[4]} -eq 0 ]
								then
									echo "Side 4 available"
								elif [ ${ARR[6]} -eq 0 ]
									then
										echo "Side 6 available"
									elif [ ${ARR[8]} -eq 0 ]
										then
											echo "Side 8 available"
										fi
		fi
	COUNT=$(($COUNT + 1))
	if [ $COUNT -eq 8 ]
	then
		echo "Draw... No more blocks left"
		exit
	fi
done

