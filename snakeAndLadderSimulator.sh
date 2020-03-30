#!/bin/bash -x

#Constants
INITIAL_POSITION=0

#To roll a die
function rollTheDie() {
	dieNumber=$((RANDOM%6+1))
}
rollTheDie
