#! /bin/bash
. functions.sh

mkdir deployment_configs

token=`oc whoami -t`
curl -H "Authorization: Bearer $token" -k -L -o deployment_configs/deploymentConfigs.json https://openshift.ossim.io:8443/oapi/v1/namespaces/omar-dev/deploymentconfigs

groovy json2yml.groovy

pushd deployment_configs

for repo in ${REPOS[@]} ; do
    app=`echo $repo | sed -n 's/.*[/]\(.*\).git$/\1/p'`

    if [[ $app == "omar-base" ]]; then
        continue
    fi

    if [[ $app == "omar-config-server" ]]; then
        continue
    fi

    if [ -e $SCRIPT_DIR/docs/$app/docsConfig.yml ]; then
        create_variables $SCRIPT_DIR/docs/$app/docsConfig.yml
    fi
    
    echo "Current App is $app"
    for deploymentConfig in `ls`; do
        echo "Current Deployment Config is $deploymentConfig"
        if [[ $deploymentConfig == *"$app"* ]]; then
            echo "Found deploymentConfig for $app"
            if [ ! -z "$app_installGuide" ]; then
                GUIDE=$SCRIPT_DIR/docs/$app/$app_installGuide
            else
                GUIDE=$SCRIPT_DIR/docs/$app/docs/install-guide/$app.md
            fi
            # only modify the guide if it exists and a deployment config exists
            if [ -e $GUIDE ]; then
                echo "Found match for $app"
                echo "" >> $GUIDE # make sure you start on a new line
                echo "## Example OpenShift Deployment Config" >> $GUIDE
                echo "\`\`\`" >> $GUIDE
                cat $deploymentConfig >> $GUIDE
                echo  "\`\`\`" >> $GUIDE
                break
            fi
        fi
    done
    unset_vars
done

popd
