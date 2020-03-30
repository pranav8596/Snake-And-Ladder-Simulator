#!/bin/bash

#Constants
INITIAL_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2

#Variables
playerPosition=0
playerOnePosition=$INITIAL_POSITION
playerTwoPosition=$INITIAL_POSITION
dieCount=0
switchPlayer=0

#To roll a die
function rollTheDie() {
	dieNumber=$((RANDOM%6+1))
	echo "Die number: $dieNumber"
	((dieCount++))
}

#To check for No Play,Ladder or Snake options
function checkForOptions() {
	rollTheDie
	checkOptions=$((RANDOM%3))
	case $checkOptions in
		$NO_PLAY)
			playerPosition=$playerPosition
			echo "No Play"
			;;
		$LADDER)
			playerPosition=$(($playerPosition + $dieNumber))
			echo "LADDER! Moving upwards by $dieNumber steps"
			;;
		$SNAKE)
			playerPosition=$(($playerPosition - $dieNumber))
			echo "Snake! Moving downwards by $dieNumber steps"
			;;
	esac
	BelowStartAboveWin
}

#If position is below 0, restarts from 0
#Or if its above 100, stays in previous position
function BelowStartAboveWin() {
	if [ $playerPosition -lt $INITIAL_POSITION ]
	then
		playerPosition=$INITIAL_POSITION
		echo "Position is below 0. Restart from 0"
	elif [ $playerPosition -gt $WINNING_POSITION ]
	then
		playerPosition=$(($playerPosition - $dieNumber))
		echo "Position is above 100. Stayed in the previous position"
	fi
}

#Player One plays on getting its turn
function firstPlayerTurn() {
	echo "PLAYER ONE'S TURN"
	playerPosition=$playerOnePosition
	checkForOptions
	playerOnePosition=$playerPosition
	echo -e "Player One position: $playerOnePosition\n"
	switchPlayer=1
}

#Player Two plays on getting its turn
function secondPlayerTurn() {
	echo "PLAYER TWO'S TURN"
	playerPosition=$playerTwoPosition
	checkForOptions
	playerTwoPosition=$playerPosition
	echo -e "Player Two position: $playerTwoPosition\n"
	switchPlayer=0
}

#To switch from Player One to Player Two
function switchThePlayer() {
	if [ $switchPlayer -eq 0 ]
	then
		firstPlayerTurn
	else
		secondPlayerTurn
	fi
	checkWinningStatus
}

#To check the Winning status of each Player
function checkWinningStatus() {
	if [ $playerOnePosition -eq $WINNING_POSITION ]
	then
		echo "Player ONE have WON the game!"
	elif [ $playerTwoPosition -eq $WINNING_POSITION ]
	then
		echo "Player TWO have WON the game!"
	fi
}

#To repeat the player till reaches the winning position
function snakeAndLadderSimulator() {
	while [ $playerPosition -ne $WINNING_POSITION ]
	do
		switchThePlayer
	done
	echo "Number of times dice thrown: $dieCount"
}

#Main
snakeAndLadderSimulator
