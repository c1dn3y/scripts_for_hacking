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
echo -n "Brute force (y/n): "
read brute
if brute = y
  brutey == ""
  else 
    brutey == "--no-brute"
echo -n "Continue on success (y/n): "
read brute
if brute = y
  cos == "--continue-on-success"
  else 
    cos == ""


for i in ${protos[@]}; 
  do
  netexec $i $ip -u $user -p $password -d $domain $brutey --continue-on-success
done
