# Listing all Computers in Active Directory

ldapsearch -H ldaps://hostname.company.de -x -W -D "user@company" -b "dc=company,dc=de" "(&(&(&(samAccountType=805306369)(!(primaryGroupId=516)))(objectCategory=computer)))" | grep dNSHostName > allhostnames.txt


# Listing all users in Active Directory

ldapsearch -H ldaps://meinserver.meinefirma.de -x -W -D "benutzername@meinefirma.de" -b "cn=users,dc=meinefirma,dc=de"

# Listing all groups in Active Directory

ldapsearch -H ldaps://meinserver.meinefirma.de -x -W -D "benutzername@meinefirma.de" -b "dc=meinefirma,dc=de" -s sub -x "objectclass=group"


# Listing Members of all groups in Active Directory

ldapsearch -H ldaps://meinserver.meinefirma.de -x -W -D "benutzername@meinefirma.de" -b "dc=meinefirma,dc=de" -s sub -x "objectclass=group" member

# Showing properties of AD-Computer

Get-ADComputer -Property * | Get-Member -MemberType Properties


