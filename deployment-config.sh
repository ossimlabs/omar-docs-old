#! /bin/bash
. functions.sh


mkdir deployment_configs

token=`oc whoami -t`
curl -H "Authorization: Bearer $token" -k -L -o deployment_configs/deploymentConfigs.json https://openshift.ossim.io:8443/oapi/v1/namespaces/omar-dev/deploymentconfigs

groovy json2yml.groovy

pushd deployment_configs

for repo in ${REPOS[@]} ; do
    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`
    echo "Current App is $app"
    for deploymentConfig in `ls`; do
        echo "Current Deployment Config is $deploymentConfig"
        if [[ $deploymentConfig == *"$app"* ]]; then
            GUIDE=$SCRIPT_DIR/docs/$app/docs/install-guide/$app.md
            echo "Found deploymentConfig for $app"
            # only modify the guide if it exists and a deployment config exists
            if [ -e $GUIDE ]; then
                echo "Found install-guide for $app"
                echo "" >> $GUIDE # make sure you start on a new line
                echo "## Example OpenShift Deployment Config." >> $GUIDE
                echo "\`\`\`" >> $GUIDE
                cat $deploymentConfig >> $GUIDE
                echo  "\`\`\`" >> $GUIDE
            fi
        fi
    done
done

popd
