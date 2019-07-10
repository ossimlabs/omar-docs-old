#! /bin/bash
. functions.sh


mkdir deployment_configs

oc login --insecure-skip-tls-verify https://openshift.ossim.io:8443 -u $OPENSHIFT_USERNAME -p $OPENSHIFT_PASSWORD
token=`oc whoami -t`
curl -H "Authorization: Bearer $token" -k -L -o deployment_configs/deploymentConfigs.json https://openshift.ossim.io:8443/oapi/v1/namespaces/omar-dev/deploymentconfigs

groovy json2yml.groovy

pushd deployment_configs

for repo in ${REPOS[@]} ; do
    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    for deploymentConfig in `ls`; do
        if [[ $deploymentConfig == *"$app"* ]]; then
            GUIDE=$SCRIPT_DIR/docs/$app/docs/install-guide/$app.md
            # only modify the guide if it exists and a deployment config exists
            if [ -e $GUIDE ]; then
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
