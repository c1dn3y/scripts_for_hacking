#!/bin/bash
# netexec all protocols
protos=("wmi" "rdp" "winrm" "ldap" "ssh" "mssql" "nfs" "smb" "ftp" "vnc")
echo -n "Enter the username or name of file containing usernames: "
read user
echo -n "Enter the password or name of file containing passwords: "
read password
echo -n "Enter the domain: "
read domain
echo -n "Enter the target IP: "
read ip

for i in ${protos[@]}; 
  do
  netexec $i $ip -u $user -p $password -d $domain --no-brute --continue-on-success
done
