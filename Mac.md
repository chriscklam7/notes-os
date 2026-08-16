# Notes of Mac


<details>
<summary>Alias ll</summary>

<br />

```shell
cat >> ~/.zshrc << 'EOF'

# ls alias
alias ll='ls -alF'
EOF
```

<br />

</details>

<details>
<summary>Control Brightness</summary>

<br />

MonitorControl Lite from App Store - [https://apps.apple.com/gb/app/monitorcontrol-lite/id1595464182?mt=12](https://apps.apple.com/gb/app/monitorcontrol-lite/id1595464182?mt=12)

<br />

</details>

<details>
<summary>Create bootable USB</summary>

<br />

balenaEtcher - [https://etcher.balena.io/](https://etcher.balena.io/)

<br />

</details>

<details>
<summary>Disable creating .DS_Store on external drive</summary>

<br />

```shell
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
```

<br />

</details>

<details>
<summary>Re-enable creating .DS_Store on external drive</summary>

<br />

```shell
defaults delete com.apple.desktopservices DSDontWriteUSBStores
```

<br />

</details>

<details>
<summary>Disable creating .DS_Store on network drive</summary>

<br />

```shell
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
```

<br />

</details>

<details>
<summary>Re-enable creating .DS_Store on network drive</summary>

<br />

```shell
defaults delete com.apple.desktopservices DSDontWriteNetworkStores
```

<br />

</details>

<details>
<summary>Verify desktop services</summary>

<br />

```shell
defaults read com.apple.desktopservices
```

<br />

</details>

<details>
<summary>Flush DNS</summary>

<br />

```shell
sudo killall -HUP mDNSResponder
```

<br />

</details>

<details>
<summary>Install Homebrew</summary>

<br />

URL - [https://brew.sh/](https://brew.sh/)
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

<br />

</details>

<details>
<summary>Power Metrics</summary>

<br />

```shell
sudo powermetrics
```

<br />

</details>

<details>
<summary>Schedule</summary>

<br />

Wake up
```shell
sudo pmset repeat wakeorpoweron MTWRF 9:00:00
```

Shutdown
```shell
sudo pmset repeat shutdown MTWRF 17:00:00
```

Wake up and shutdown (1 command only)
```shell
sudo pmset repeat wakeorpoweron MTWRF 9:00:00 shutdown MTWRF 17:00:00
```

Check schedule
```shell
sudo pmset -g sched
```

Cancel schedule
```shell
sudo pmset repeat cancel
```

<br />

</details>

<details>
<summary>System uptime</summary>

<br />

```shell
uptime
```

<br />

</details>
