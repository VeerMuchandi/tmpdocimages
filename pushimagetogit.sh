TMP_DIR=$(mktemp --directory)
echo $TMP_DIR
pushd "${TMP_DIR}"
git init
git remote add origin git@github.com:VeerMuchandi/tmpdocimages.git 
git pull -u origin master
git rm *
git commit -m "removed old files"
git push -u origin master
docker save -o bb.tar veermuchandi/welcome 
git add .
git commit -m "added bb.tar"
popd
rm -rf "${TMP_DIR}"
