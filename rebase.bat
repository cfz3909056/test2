mkdir git-rebase-demo
cd git-rebase-demo
git init

echo 1 > a.txt
git add .
git commit -m "Initial commit (a.txt created)"

ping 127.0.0.1 -n 2 >nul

echo 2 > a.txt
git add .
git commit -m "Update a.txt to 2"

ping 127.0.0.1 -n 2 >nul

git checkout -b branch1
echo b > b.txt
git add .
git commit -m "Add b.txt"

echo c > c.txt
git add .
git commit -m "Add c.txt"

echo 333 > c.txt
git add .
git commit -m "Update c.txt to 333"

echo d > d.txt
git add .
git commit -m "Add d.txt"

ping 127.0.0.1 -n 2 >nul

git checkout branch1
git rebase master

git checkout master
git merge branch1 --no-ff

git branch -d branch1
