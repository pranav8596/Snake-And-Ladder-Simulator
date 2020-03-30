#!/bin/bash -x

#Constants
INITIAL_POSITION=0
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
}
checkForOptions
