[T4Scaffolding.Scaffolder(Description = "DotNetRoo ActiveRecord Scaffold")][CmdletBinding()]
param(        
    [string]$Project,
	[string]$CodeLanguage,
	[string[]]$TemplateFolders,
	[switch]$Force = $true
)

#Add T4Scaffolding
#Write-Host Installing : T4Scaffolding
#Install-Package T4Scaffolding

#Add Castle ActiveRecord Library from Nuget
Write-Host Installing : EntityFramework
Install-Package Castle.Activerecord

#Add SQLite Driver
#Install-Package System.Data.SQLite.x64
Install-Package SQLitex64

#Add Program.cs with sample code
$outputPath = "Program"  # The filename extension will be added based on the template's <#@ Output Extension="..." #> directive
$namespace = (Get-Project $Project).Properties.Item("DefaultNamespace").Value

Add-ProjectItemViaTemplate $outputPath -Template DotNetRoo.ActiveRecord.Template `
	-Model @{ Namespace = $namespace; ExampleValue = "Hello, world!" } `
	-SuccessMessage "Added Test Code for ActiveRecord at {0}" `
	-TemplateFolders $TemplateFolders -Project $Project -CodeLanguage $CodeLanguage -Force:$Force
	
#Add App.config with sample code
$outputPath = "App"  # The filename extension will be added based on the template's <#@ Output Extension="..." #> directive
$namespace = (Get-Project $Project).Properties.Item("DefaultNamespace").Value

Add-ProjectItemViaTemplate $outputPath -Template AppConfig.Template `
	-Model @{ Namespace = $namespace; ExampleValue = "Hello, world!" } `
	-SuccessMessage "Added app.config" `
	-TemplateFolders $TemplateFolders -Project $Project -CodeLanguage $CodeLanguage -Force:$Force	