#! /bin/bash

# mkdocs requires a docs directory in which to place all relavent markup files
pushd docs

for repo in ${REPOS[@]} ; do

	app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

	# start from scratch if the user passes the "clean" argument
	if [ "$1" = "clean" ]; then
		rm -rf $app
	fi

	# if a directory does not exist for the app, create one
	if [ ! -d "$app" ]; then
		echo "Creating $app docs directory..."
  		mkdir $app
		pushd $app

		# only checkout the folder containing the documentation
		echo "Checking out documentation for $app..."
		git init
		git remote add -f origin https://$GIT_USERNAME:$GIT_PASSWORD@$repo
		rm -rf $app/apps
		git config core.sparsecheckout true
		echo "docs" > .git/info/sparse-checkout
	else
 		pushd $app
	fi

	git pull --depth 1 origin dev

	popd
done

popd
