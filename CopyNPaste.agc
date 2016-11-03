//*************************
//*** CopyNPaste Library***
//*************************

//***Contents***
// WriteIt(text$) Creates a file and writes text$ to it, use "" for empty file
// ReadIt() Returns text$ read from file
// ShowIt(delete) Opens file in Notepad on Windows
// CopyIt() Copies file contents to Windows clipboard

// System calls in ShowIt & CopyIt can be changed for use on other OS

//***Example Usage***
// Situation:  TextBox needs text pasted into it
// Example:
//   WriteIt("")
//   ShowIt(0)
//   [User pastes text into Notepad, then saves & closes Notepad]
//   SetEditBoxText(1,ReadIt())
//
// Situation:  Need to copy from TextBox
// Example 1:
//  WriteIt(GetEditBoxText(1))
//  CopyIt()
//
// Example 2:
//  WriteIt(GetEditBoxText(1))
//  ShowIt(1)
//  [User copies text from Notepad, then closes Notepad]

// Creates a file and writes text to it
function WriteIt(text as string)
	temp = OpenToWrite("temp.txt")
	WriteLine(temp,text)
	CloseFile(temp)
endfunction

// Reads text$ from file
function ReadIt()
	temp = OpenToRead("temp.txt")
	text$ = ReadLine(temp)
	CloseFile(temp)
endfunction text$

// Opens file in Notepad on Windows - text can then be copy/pasted from Notepad
// Setting "delete" allows you to use this function similar to CopyIt, by opening Notepad for copying the text, and then deleting the file
function ShowIt(delete as integer)
	id = RunApp("cmd","/c notepad %localappdata%\AGKApps\CryptTool\media\temp.txt") //had to use cmd call, rather than direct to notepad so that the path would resolve
	while GetAppRunning(id)
		sync()
	endwhile
	if delete then DeleteFile("temp.txt")
endfunction

// Copies contents of the file to the Windows clipboard - text can then be pasted elsewhere
function CopyIt()
	id = RunApp("cmd", "/c clip < %localappdata%\AGKApps\CryptTool\media\temp.txt")
	while GetAppRunning(id)
		sync()
	endwhile
	DeleteFile("temp.txt")
endfunction
