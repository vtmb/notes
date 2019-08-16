# nicht vergessen: gitignore.io!

Gilt, wenn es schon ein lokales Repository gibt, das auf den Server soll.

auf dem server:

```bash
cd /home/git
su git
mkdir neuesprojekt.git
cd neuesprojekt.git
git init --bare --shared=group
```

auf dem client(arbeitsrechner)

```bash
cd /path/to/project
git init
touch readme.md
git add readme.md
git commit -am "initial commit, added readme"
git remote add origin git@mydomain.de:/home/git/neuesprojekt.git
git remote set-url origin git@mydomain.de:/home/git/neuesprojekt.git
git push -u origin master
git push --set-upstream origin master
```

# Keys einrichten

im Heimatverzeichnis des git-users kann man die public keys derjenigen hinterlegen, die am Projekt mitarbeiten wollen

```bash
~/.ssh/authorized_keys
```

diese können einfach angehängt werden

```bash
cat /tmp/id_rsa.coworker.pub >> ~/.ssh/authorized_keys
```
