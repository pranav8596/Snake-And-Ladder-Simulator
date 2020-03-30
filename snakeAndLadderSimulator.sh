#!/bin/bash -x

#Constants
INITIAL_POSITION=0
WINNING_POSITION=100
NO_PLAY=0
LADDER=1
SNAKE=2

#Variables
playerPosition=0

#To roll a die
function rollTheDie() {
	dieNumber=$((RANDOM%6+1))
}

#To check for No Play,Ladder or Snake options
function checkForOptions() {
	rollTheDie
	checkOptions=$((RANDOM%3))
	case $checkOptions in
		$NO_PLAY)
			playerPosition=$playerPosition
			;;
		$LADDER)
			playerPosition=$(($playerPosition + $dieNumber))
			;;
		$SNAKE)
			playerPosition=$(($playerPosition - $dieNumber))
			;;
	esac
	positionBelowStart
}

#If position moves below 0, restarts from 0
function positionBelowStart() {
	if [ $playerPosition -lt $INITIAL_POSITION ]
	then
		playerPosition=$INITIAL_POSITION
	fi
}

#To repeat the player till reaches the winning position
function snakeAndLadderSimulator() {
	while [ $playerPosition -ne $WINNING_POSITION ]
	do
		checkForOptions
	done
}

#Main
snakeAndLadderSimulator
