#! /bin/bash

# mkdocs requires a docs directory in which to place all relavent markup files
pushd docs

for repo in ${REPOS[@]} ; do

	app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

	rm -rf $app
	echo "Checking out documentation for $app..."
	git clone --depth=1 https://$GIT_USERNAME:$GIT_PASSWORD@$repo
done

popd
