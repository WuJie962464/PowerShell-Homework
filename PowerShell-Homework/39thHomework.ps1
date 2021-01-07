$path="D:\C#\Training\39th\PowerShell-Homework\DropConfig.txt"
$dropConfig=Get-Content $path
$filePath=""
$content=""
$Path=""
$fileName=""

for($i = 0; $i -lt [int]$dropConfig.Count; $i++)
{
    $dropConfigValue = $dropConfig[$i]
   if(![string]::IsNullOrWhiteSpace($dropConfigValue))
    {
      if($dropConfigValue.StartsWith("\\winbuilds\release"))
      {

       if($dropConfigValue.Contains("en-us") -and $dropConfigValue.Contains("amd64fre"))
       {
          $filePath="D:\C#\Training\39th\PowerShell-Homework\ENUS\amd64fre\x64.txt"
          $Path="D:\C#\Training\39th\PowerShell-Homework\ENUS\amd64fre\"
          $fileName="x64"
       }
       if($dropConfigValue.Contains("en-us") -and $dropConfigValue.Contains("x86fre"))
       {
          $filePath="D:\C#\Training\39th\PowerShell-Homework\ENUS\x86fre\x86.txt"
          $Path="D:\C#\Training\39th\PowerShell-Homework\ENUS\x86fre\"
          $fileName="x86"
       }
       if($dropConfigValue.Contains("zh-cn") -and $dropConfigValue.Contains("x86fre"))
       {
         $filePath="D:\C#\Training\39th\PowerShell-Homework\ZHCN\x86fre\x86.txt"
         $Path="D:\C#\Training\39th\PowerShell-Homework\ZHCN\x86fre\"
         $fileName="x86"
       }
       if($dropConfigValue.Contains("zh-cn") -and $dropConfigValue.Contains("amd64fre"))
       {
         $filePath="D:\C#\Training\39th\PowerShell-Homework\ZHCN\amd64fre\x64.txt"
         $Path="D:\C#\Training\39th\PowerShell-Homework\ZHCN\amd64fre\"
         $fileName="x64"
       }
      }
      elseif($dropConfigValue.StartsWith("WD.CloudTest"))
      {
       $content=$dropConfigValue
       if(Test-Path $filePath -PathType Leaf)
       {
        Remove-Item $filePath
       }
       else
       {
       New-Item -Path $Path -Name $fileName -ItemType "file"
       }
       Set-Content -Path $filePath -Value $content
      }
    }
  }
