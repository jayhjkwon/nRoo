[T4Scaffolding.Scaffolder(Description = "DotNetRoo ActiveRecord Scaffold")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $false
)

#Add Castle ActiveRecord Library from Nuget
Write-Host Installing : EntityFramework
Install-Package Castle.Activerecord

#Add SQLite Driver
#Install-Package System.Data.SQLite.x64
Install-Package SQLitex64


$outputPath = "ExampleOutput"  # The filename extension will be added based on the template's <#@ Output Extension="..." #> directive
$namespace = (Get-Project $Project).Properties.Item("DefaultNamespace").Value

Add-ProjectItemViaTemplate $outputPath -Template DotNetRoo.ActiveRecord.Template `
	-Model @{ Namespace = $namespace; ExampleValue = "Hello, world!" } `
	-SuccessMessage "Added TestScaffold output at {0}" `
	-TemplateFolders $TemplateFolders -Project $Project -CodeLanguage $CodeLanguage -Force:$Force