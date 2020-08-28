# Listing all users in Active Directory

ldapsearch -H ldaps://meinserver.meinefirma.de -x -W -D "benutzername@meinefirma.de" -b "cn=users,dc=meinefirma,dc=de"

# Listing all groups in Active Directory

ldapsearch -H ldaps://meinserver.meinefirma.de -x -W -D "benutzername@meinefirma.de" -b "dc=meinefirma,dc=de" -s sub -x "objectclass=group"


# Listing Members of all groups in Active Directory

ldapsearch -H ldaps://meinserver.meinefirma.de -x -W -D "benutzername@meinefirma.de" -b "dc=meinefirma,dc=de" -s sub -x "objectclass=group" member

# Showing properties of AD-Computer

Get-ADComputer -Property * | Get-Member -MemberType Properties


