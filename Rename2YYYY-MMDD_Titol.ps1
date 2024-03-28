Param($Pattan, [switch]$WhatIf)
##########################################################################
# 「YYYY-MMDD」を含むファイル名を 「YYYY-MMDD タイトル」に Rename する
##########################################################################
if( $Pattan -eq $null ){
	Write-Output "バターンが入力されていません"
	exit
}

$Files = Get-ChildItem $Pattan -Recurse

foreach( $File in $Files ){
	if( $File.Name -match "(?<TimeStamp>[ _-]*[0-9]{4}\-[0-9]{4}[ _-]*?)"){
		$TempTimeStamp = $Matches.TimeStamp

		$Tempbody = $File.Name -replace $TempTimeStamp , ""
		$body = $Tempbody -replace "^[ _-]*" , ""	# replace の Bug ぽい動作回避

		$TempTimeStamp = $TempTimeStamp -replace "^[ _-]*", ""
		$TimeStamp = $TempTimeStamp -replace "[ _-]*$", ""

		$NewName = $TimeStamp + " " + $body

		if( $File.Name -ne $NewName ){
			Write-Output $File.FullName
			Write-Output $NewName
			Write-Output " "

			if( -not $WhatIf ){
				Rename-Item -Path $File.FullName -NewName $NewName
			}
		}
	}
}


