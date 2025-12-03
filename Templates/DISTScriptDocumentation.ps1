<#	
	.NOTES
    	These are some notes about everything ...

	.DESCRIPTION
		This script shows how to add documentation to a script or function.

	.PARAMETER Switch
	    This is a non-working parameter.

	.PARAMETER Existing
	    This is an existing parameter.
	    Take care: Parameter in documentation does not appear, if it is not in the param-section of the script or function.
	    At the other hand, a parameter of the param-section appears in help.
    
	.EXAMPLE	
	    DISTScriptDocumentation.ps1
	.EXAMPLE
	    DISTScriptDocumentation.ps1 -Switch

	.LINK
	    Follow this link to see more options: http://www.dist.at
    .LINK
        A link again: http://www.microsoft.com

	.SYNOPSIS
	    This is a synopsis, a short description of what a script is doing.

	.INPUTS
        The Microsoft .NET Framework types of objects that can be piped to the
        function or script. You can also include a description of the input 
        objects.

    .OUTPUTS
        The .NET Framework type of the objects that the cmdlet returns. You can
        also include a description of the returned objects.
	
#>

param ( [Switch]$Switch, [bool]$Existing, [char]$OnlyInPara )

$out = @"

Use Get-Help ScriptName.ps1 to see the following items: Name, Synopsis, Syntax, Description, Links (= Related Links), (Remarks)

Use Get-Help ScriptName.ps1 -Detailed to see: Name, Synopsis, Syntax, Parameter, Example, (Remarks)

Use Get-Help ScriptName.ps1 -Full to see: Name, Synopsis, Syntax, Description, Parameters, Inputs, Outputs, Notes, Example, LINKS (= Related Links)


"@

Write-Host $out -ForegroundColor 'Cyan'