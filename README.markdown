# Welcome to QDisplay

QDisplay is a tiny OS X application for use with [QLab](http://figure53.com/qlab).

It does only one thing: display [a floating window](http://figure53.com/devbox/2011-02-10-14-08-44%20qdisplay.png) in which you can specify a message using AppleScript.

## Requirements

QDisplay requires Mac OS 10.6.

Building QDisplay requires XCode. 

## Download

You can download a pre-built copy of QDisplay here:

[http://figure53.com/downloads/QDisplay.zip](http://figure53.com/downloads/QDisplay.zip)

## Usage

QDisplay does only one thing: display text.  You can only set the text using AppleScript.

*Example 1:*

`
tell application "QDisplay"
	set message to "Put your message here."
end tell
`

*Example 2:*

`
tell front workspace
	set myMessage to q name of cue "1"
end tell
tell application "QDisplay"
	set message to myMessage
end tell
`
