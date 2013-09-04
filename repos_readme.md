https://help.github.com/articles/syncing-a-fork

http://superuser.com/questions/456145/how-can-i-resync-a-fork-from-original

http://stackoverflow.com/questions/10307153/how-do-i-re-grab-a-forked-git-repo-without-deleting-and-re-forking

git remote
  master
  upstream


git pull
git pull upstream #name of branch#
git push origin #name of branch#


after adding new branch to original :
git fetch upstream (branch already exists on locla machine)
git push origin upstream/#name of new branch# (push new branch into your forked repo on github) 
