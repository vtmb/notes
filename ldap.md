# Gathering Info

```bash
ldapsearch -h hostname.company.de -x -b '' -s base '(objectclass=*)'

# Listing all Computers in Active Directory

```bash
ldapsearch -H ldaps://hostname.company.de -x -W -D "user@company" -b "dc=company,dc=de" "(&(&(&(samAccountType=805306369)(!(primaryGroupId=516)))(objectCategory=computer)))" | grep dNSHostName > allhostnames.txt
```

# Listing all users in Active Directory

```bash
ldapsearch -H ldaps://meinserver.meinefirma.de -x -W -D "benutzername@meinefirma.de" -b "cn=users,dc=meinefirma,dc=de"
```

# Listing all groups in Active Directory

```bash
ldapsearch -H ldaps://meinserver.meinefirma.de -x -W -D "benutzername@meinefirma.de" -b "dc=meinefirma,dc=de" -s sub -x "objectclass=group"


# Listing Members of all groups in Active Directory

```bash
ldapsearch -H ldaps://meinserver.meinefirma.de -x -W -D "benutzername@meinefirma.de" -b "dc=meinefirma,dc=de" -s sub -x "objectclass=group" member
```

# Showing properties of AD-Computer

```bash
Get-ADComputer -Property * | Get-Member -MemberType Properties
```
# Example for exporting all users as ldif file

```bash
ldifde -f testerei -p subtree -r "(&(objectcategory=person)(objectclass=user)(givenname=*))" -l "cn,givenname,ob
jectclass,samaccountname"
```
