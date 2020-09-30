# Welcome to QDisplay

QDisplay is a tiny OS X application for use with [QLab](http://figure53.com/qlab).

It does only one thing: display a floating window in which you can specify a message using AppleScript.

![Screenshot of QDisplay](https://figure53.com/downloads/QDisplay.png)

## Requirements

QDisplay requires Mac OS 10.6+.

Building QDisplay requires XCode. 

## Download

You can download a pre-built copy of QDisplay here:

[https://figure53.com/downloads/QDisplay.zip](https://figure53.com/downloads/QDisplay.zip)

## Usage

QDisplay does only one thing: display text.  You can only set the text using AppleScript.

*Example 1:*

	tell application "QDisplay"
		set message to "Put your big yellow message here."
		set messageSize to 100
		set messageColor to "yellow"
	end tell

*Example 2:*

	tell front workspace
		set myMessage to q name of cue "1"
	end tell
	tell application "QDisplay"
		set message to myMessage
	end tell
	
*Example 3:*
	
	tell front workspace
		set myTime to duration of cue "1"
	end tell
	tell application "QDisplay"
		set timeRemaining to myTime
	end tell
