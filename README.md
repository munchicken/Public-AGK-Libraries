# My public AGK libraries

Helpful libraries to use with App Game Kit.

## CopyNPaste
This is a work-around for the lack of clipboard support for text boxes.

**WriteIt(text$)** Creates a file and writes text$ to it, use "" for empty file
**ReadIt()** Returns text$ read from file
**ShowIt(delete)** Opens file in Notepad on Windows
**CopyIt()** Copies file contents to Windows clipboard

*System calls in ShowIt & CopyIt can be changed for use on other OS*

***Example Usage***
Situation:  TextBox needs text pasted into it
Example:
  WriteIt("")
  ShowIt(0)
  [User pastes text into Notepad, then saves & closes Notepad]
  SetEditBoxText(1,ReadIt())

Situation:  Need to copy from TextBox
Example 1:
  WriteIt(GetEditBoxText(1))
  CopyIt()

Example 2:
  WriteIt(GetEditBoxText(1))
  ShowIt(1)
