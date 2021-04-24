# GIT Command Reference

### Fixing missing origin remote
```bash
$ git push -u origin main
fatal: 'origin' does not appear to be a git repository
fatal: The remote end hung up unexpectedly
...

# To fix thisverify current remotes
git remote -v 
# add reference to origin branch
git remote add origin <url/to/repo>
```