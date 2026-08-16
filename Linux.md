# Notes of Linux


<details>
<summary>APT - Locked</summary>

```shell
sudo killall apt apt-get
```

```shell
sudo rm /var/lib/apt/lists/lock
```

```shell
sudo rm /var/cache/apt/archives/lock
```

```shell
sudo rm /var/lib/dpkg/lock*
```

</details>

<details>
<summary>Disable password feedback</summary>

<br />

```shell
echo 'Defaults !pwfeedback' | sudo EDITOR='tee' visudo -f /etc/sudoers.d/disable-pwfeedback > /dev/null
```

</details>

<details>
<summary>Flush DNS</summary>

<br />

Ubuntu 22.04+
```shell
resolvectl flush-caches
```

Ubuntu 20.04-
```shell
systemd-resolve --flush-caches
```

</details>

<details>
<summary>Mount</summary>

<br />

Get UUID of drives
```shell
blkid
```

Return record
```
/dev/sda1 UUID="######" BLOCK_SIZE="???" TYPE="XFS"
```

Create mount point
```shell
sudo mkdir /mnt/data
sudo chmod 777 /mnt/data
sudo chmod a+t /mnt/data
```

Mount directly at once
```shell
sudo mount -t nfs -o rw,hard,_netdev,nofail,noatime,vers=4.2,x-systemd.automount,x-systemd.idle-timeout=600 nfsserver:/export/data /mnt/data
```

Mount after start-up by /etc/fstab
```shell
cat >> /etc/fstab << 'EOF'

# /mnt/data
UUID=###### /mnt/data xfs defaults,noatime,nofail 0 2
EOF
```

```shell
cat >> /etc/fstab << 'EOF'

# /mnt/data
nfsserver:/export/data /mnt/data nfs rw,hard,_netdev,nofail,noatime,vers=4.2,x-systemd.automount,x-systemd.idle-timeout=300 0 0
EOF
```

Reload system control daemon
```shell
sudo systemctl daemon-reload && sudo mount -a
```


</details>

<details>
<summary>SSL cert - Import</summary>

<br />

Copy SSL cert
```shell
cp [CERT] /usr/local/share/ca-certificates/
```

Update CA trust store
```shell
update-ca-certificates
```

Update cert permission
```shell
chmod 644 /etc/ssl/certs/[CERT]
```

<br />

</details>

<details>
<summary>LVM</summary>

<br />

Installation
```shell
sudo apt-get install -y lvm2
```

List drive
```shell
lsblk
```

Create partition with parted
```shell
parted /dev/sda
```

In parted, create GPT partition label
```shell
mklabel gpt
```

In parted, create partition with 100% capacity
```shell
mkpart primary 0% 100%
```

Quit parted
```shell
quit
```

Display physical volume
```shell
pvdisplay
```

```shell
pvs
```

Create physical volume
```shell
pvcreate /dev/[DRIVE_LABEL]
```

Display volume group
```shell
vgdisplay
```

```shell
vgs
```

Create volume group
```shell
vgcreate [VOLUME_GROUP_LABEL] /dev/[DRIVE_LABEL]
```

Display logical volume
```shell
lvdisplay
```

```shell
lvs
```

Create logical volume
```shell
lvcreate -L 100G -n [LOGICAL_VOLUME_LABEL] [VOLUME_GROUP_LABEL]
```

```shell
lvcreate -l 100%FREE -n [LOGICAL_VOLUME_LABEL] [VOLUME_GROUP_LABEL]
```

Format LVM partition with XFS
```shell
mkfs.xfs /dev/mapper/[VOLUME_GROUP_LABEL]-[LOGICAL_VOLUME_LABEL]
```

Extend logical volume
```shell
lvextend -L +200G /dev/mapper/[VOLUME_GROUP_LABEL]-[LOGICAL_VOLUME_LABEL]
```

```shell
lvextend -l +100%FREE /dev/mapper/[VOLUME_GROUP_LABEL]-[LOGICAL_VOLUME_LABEL]
```

Extend XFS partition
```shell
xfs_growfs -d /dev/mapper/[VOLUME_GROUP_LABEL]-[LOGICAL_VOLUME_LABEL]
```

</details>

<details>
<summary>User - Grant sudo</summary>

<br />

```shell
sudo adduser [USERNAME]
sudo usermod -aG sudo [USERNAME]
```

<br />

</details>
