# nicht vergessen: gitignore.io!

Gilt, wenn es schon ein lokales Repository gibt, das auf den Server soll.

auf dem server:

```bash
cd /home/git
mkdir neuesprojekt.git
cd neuesprojekt.git
git init --bare --shared=group
```

auf dem client(arbeitsrechner)

```bash
cd /path/to/project
git init
git remote set-url origin git@mydomain.de:/home/git/neuesprojekt.git
git remote add origin git@mydomain.de:/home/git/neuesprojekt.git
git push -u
git push --set-upstream origin master
```

