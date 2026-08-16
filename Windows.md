# Notes of Windows


<details>
<summary>Active Directory</summary>

<br />

Users - Export to csv
```powershell
Get-ADUser -Filter * -SearchBase "OU=[Users],OU=[Users2],DC=[ad],DC=[example],DC=[com]" -Properties DisplayName, EmailAddress, Department, Title, LastLogonDate | Select-Object ame, SamAccountName, DisplayName, EmailAddress, Department, Title, Enabled, LastLogonDate | Export-Csv -path c:\users_export.csv -NoTypeInformation -Encoding UTF8
```

</details>

<details>
<summary>Flush DNS</summary>

<br />

```powershell
ipconfig /flushdns
```

</details>

<details>
<summary>Software</summary>

<br />

Search from Registry
```powershell
$paths = @(
    'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
    'HKLM:\Software\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
    'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
)

Get-ItemProperty $paths -ErrorAction SilentlyContinue |
    Where-Object { $_.DisplayName -like '*[SOFTWARE_NAME]*' } |
    Select-Object DisplayName, DisplayVersion, Publisher, UninstallString |
    Format-Table -AutoSize
```

Search from CimInstance
```powershell
Get-CimInstance Win32_Product -Filter "Name LIKE '%[SOFTWARE_NAME]%'" | Select-Object Name, Version, IdentifyingNumber
```

Search from winget
```powershell
winget list --name "[SOFTWARE_NAME]"
```

Full list from WMIObject
```powershell
Get-WMIObject Win32_InstalledWin32Program | select Name, Version, ProgramId
```

Full list from Registry
```powershell
reg query HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Uninstall /s
```

</details>

<details>
<summary>User - Run as another user</summary>

<br />

```powershell
tart-Process "C:\Windows\System32\cmd.exe" -workingdirectory $PSHOME -Credential [DOMAIN]\[DOMAIN_ACCOUNT] -ArgumentList "/c [COMMAND]"
```

</details>
