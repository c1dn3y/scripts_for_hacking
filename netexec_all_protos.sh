#!/bin/bash
# netexec all protocols
protos=("wmi" "rdp" "winrm" "ldap" "mssql" "smb")
protos2=("ssh" "nfs" "ftp" "vnc")
echo -n "Enter the username or name of file containing usernames: "
read user
echo -n "Enter the password or name of file containing passwords: "
read password
echo -n "Enter the domain: "
read domain
echo -n "Enter the target IP: "
read ip


read -p "Brute force (y/n): " brute
if [[ "$brute" == "n" ]]; then
  brutey="--no-brute"
else
  brutey=""
fi

read -p "Continue on success (y/n): " cos_input 
if [[ "$cos_input" == "y" ]]; then
  cos="--continue-on-success"
else
  cos=""
fi

preview_command="netexec $i $ip -u \"$user\" -p \"$password\" -d \"$domain\" $brutey $cos"

echo -n "Your command: $preview_command"
read -p "Is this what you want to run (y/n)? " 
ans

if [[ "$ans" == "n" ]]; then 
  echo "Exiting."
  exit 0 
fi

for i in "${protos[@]}"; do 
  echo "Running: netexec $i $ip -u \"$user\" -p \"$password\" -d \"$domain\" $brutey $cos"
  netexec "$i" "$ip" -u "$user" -p "$password" -d "$domain" "$brutey" "$cos" 
done

for i in "${protos2[@]}"; do 
  echo "Running: netexec $i $ip -u \"$user\" -p \"$password\" $brutey $cos"
  netexec "$i" "$ip" -u "$user" -p "$password" "$brutey" "$cos" 
done

echo "Script finished."
