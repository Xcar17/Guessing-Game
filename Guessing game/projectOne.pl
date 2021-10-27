#Student Name: Carlos Ocasio
#Program Name:  Guessing Game
#Creation Date:  07/30/2020
#Last Modified Date:  10/27/2021
#CSCI Course:  Survey Of Scripting Languages (301)
#Grade Received:  100%
#Design Comments:This script created in Perl is a Guessing Game where the user attempts to guess a number. 
#The script generates a random positive number from a range of values determined by the user. 
#The user will be given an option to quit the game after the first failed guess and after every third failed guessing attempt. 
#If the user decides to quit the game without correctly guessing the number, the correct number will be printed to the screen before exiting the game.

#!/usr/bin/perl

use strict;
use warnings;

#Defining my variables
my $count = 0; #Will be used to keep count of attempts
my $maxNum = 0; #Will be used to allow the user to choose a max number to get
my $exitFlag = -1; #Flag allows the user to exit the game by entering 0
my $guess = 0; #Will be used to store the guess of the user


#Displays Greeting message
print "-------------------------------------------------------------------------\n";
print "Welcome! Let us play a match of 'Guess the Number'\n";
print "-------------------------------------------------------------------------\n";
print "\nThe game will now commence!\n";


#Explain to the user that a maximum number is needed
print "\nWhat would you like the maximum number to be?";
print "\n(This will determine the range of numbers to guess)";


#While loop to ensure the user types a positive number greater than one
while($maxNum <= 1)
{
	#Prompt the user to enter the positive number to be used as max
	print "\nPlease enter a positive number greater than one: ";
	$maxNum = <STDIN>;
	print "\n";
}


#This will be the randomly generated number to guess
my $randomNumber = int(rand($maxNum)) + 1;
print "The random number was generated. Time for you to guess the number!\n";


#Do loop to ensure the entered guess is between 1 and the max number
do
{
	#Prompt user to enter a guess and save to variable
	printf "Please enter a guess that is between 1 and $maxNum";
	$guess = <STDIN>;
	print"\n";
}while($guess <= 0 || $guess > $maxNum);


#Loop will continue until the number is correctly guessed or the user gives up
while($randomNumber != $guess && $exitFlag != 0)
{
	#Display message that the guess was too high
	if($guess > $randomNumber)
	{
		print "Nice try, but your guess is too high!\n";
		print "\n";
	}
	
	#Display message that the guess was to low
	if($guess < $randomNumber)
	{
		print "Nice try, but your guess is too low!\n";
		print "\n";
	}
	
	#This will run the first time and then will run every three attempts.
	if($count % 3 == 0)
	{	
		#Do Loop ensures the values entered are either 0 or 1
		do
		{
			print "Do you want to keep playing? (enter 1 to play or 0 to exit):";
			$exitFlag = <STDIN>;
			print "\n";
		}while($exitFlag != 0 && $exitFlag != 1)
	}
	
	#If loop enables the user to attempt to guess the number again
	if($exitFlag == 1)
	{
		print "Please enter a new guess number: ";
                $guess = <STDIN>;
		print "\n";

		#While loop ensure the guess is within the correct range
                while($guess > $maxNum || $guess <= 0)
                {
                        print"*Invalid guess. Please try again: ";
                        $guess = <STDIN>;
                        print"\n";
		}
	} 

	$count++;	
}


#If the exit flag = 0 the program will display the number to guess and close itself.
if($exitFlag == 0)
{
	print "-------------------------------------------------------------------------\n";
	print "The number to guess was $randomNumber\nThank you for playing!\n";
	print "-------------------------------------------------------------------------\n";
}


#If the number guessed was correct the game will congratulate the player and close itself.
else 
{
	print "-------------------------------------------------------------------------\n";
	print "Congratulations! You guessed the number correctly. Thank you for playing!\n";
	print "-------------------------------------------------------------------------\n";
}
