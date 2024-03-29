■ これは何?
「YYYY-MMDD」を含むファイル名を、「YYYY-MMDD タイトル」のファイル名にリネームします

GitHub から Pull をすると、ファイルのタイムスタンプが Pull した日付になるので、議事メモとか日々発生するファイルをタイムスタンプでソートする事が出来なくなるので、日付順に並ぶように日付を先頭にしたファイル名に統一する際に使うと便利です

■ どう使うの?
(Rename2[TAB] で補完され Rename2YYYY-MMDD が表示されます)

Rename2YYYY-MMDD フルパス\ファイルパータン

例) C:\MTG_Memo 以下にある *.txt のうち YYYY-MMDD を含むファイル名を YYYY-MMDD タイトル.txt にリネームします
Rename2YYYY-MMDD C:\MTG_Memo\*.txt

-NoRecurse オプションを指定すると、再起検索しません(指定ディレクトリのみ対象とする)

-WhatIf オプションを指定すると、リネーム対象と変更後のファイル名のみ表示します
(意図しない Rename がされないか確認するテストモード)

ファイル名に複数の YYYY-MMDD が含まれているケースは想定していません

■ Online Install 方法
以下コマンドを PowerShell プロンプトにコピペして下さい

$ScriptName = "Rename2YYYY-MMDD_Titol"
$GitHubName = "MuraAtVwnet"
$Module = $ScriptName + ".psm1"
$Installer =  "Install" + $ScriptName + ".ps1"
$UnInstaller = "UnInstall" + $ScriptName + ".ps1"
Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ScriptName/master/$Module -OutFile ~/$Module
Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ScriptName/master/install.ps1 -OutFile ~/$Installer
Invoke-WebRequest -Uri https://raw.githubusercontent.com/$GitHubName/$ScriptName/master/uninstall.ps1 -OutFile ~/$UnInstaller
& ~/$Installer
Remove-Item ~/$Module
Remove-Item ~/$Installer


■ リポジトリから Pull した場合の Install 方法
install.ps1 を実行してください

■ Uninstall 方法
Online でインストールした場合は ~/UnInstallTSV2MarkdownTable.ps1 を実行して下さい

リポジトリから Pull した場合は uninstall.ps1 を実行して下さい
(問い合わせが来たら Enter)


■ 動作確認環境
PowerShell 5.1
PowerShell 7.4.1


■ Web サイト


■ リポジトリ
GitHub で公開しているので、最新版が欲しい方はこちらから Clone してください。

https://github.com/MuraAtVwnet/Rename2YYYY-MMDD_Titol
git@github.com:MuraAtVwnet/Rename2YYYY-MMDD_Titol.git




