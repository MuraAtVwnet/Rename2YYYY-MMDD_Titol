##########################################################################
# 「YYYY-MMDD」を含むファイル名を 「YYYY-MMDD タイトル」に Rename する
##########################################################################
function Rename2YYYY-MMDD_Titol($Pattern, [switch]$WhatIf){
	if( $Pattern -eq $null ){
		Write-Output "Path とパターンを入力してください"
		return
	}

	try{
		$Files = Get-ChildItem $Pattern -Recurse -ErrorAction Stop
	}
	catch{
		Write-Output "$Pattern は正しいパターンではありません"
		return
	}

	foreach( $File in $Files ){
		if( $File.Name -match "(?<TimeStamp>[ _-]*[0-9]{4,4}\-[0-9]{4,4}[ _-]*?)"){
			$TempTimeStamp = $Matches.TimeStamp

			$Tempbody = $File.Name -replace $TempTimeStamp , ""
			$body = $Tempbody -replace "^[ _-]*" , ""	# replace の Bug ぽい動作回避

			$TempTimeStamp = $TempTimeStamp -replace "^[ _-]*", ""
			$TimeStamp = $TempTimeStamp -replace "[ _-]*$", ""

			$NewName = $TimeStamp + " " + $body

			if( $File.Name -ne $NewName ){
				$FileFullName = $File.FullName
				$ParentPath = Split-Path $FileFullName -Parent
				$OldName = Split-Path $FileFullName -Leaf
				Write-Output $ParentPath
				Write-Output $OldName
				Write-Output $NewName
				Write-Output " "

				if( -not $WhatIf ){
					Rename-Item -Path $File.FullName -NewName $NewName
				}
			}
		}
	}
}


