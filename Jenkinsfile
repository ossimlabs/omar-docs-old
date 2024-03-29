properties([
    parameters ([
        string( name: 'BUILD_NODE', defaultValue: 'omar-build', description: 'The build node to run on' ),
        booleanParam( name: 'CLEAN_WORKSPACE', defaultValue: true, description: 'Clean the workspace at the end of the run' )
    ]),
    pipelineTriggers([
            [ $class: "GitHubPushTrigger" ]
    ]),
    [ $class: 'GithubProjectProperty', displayName: '', projectUrlStr: 'https://github.com/ossimlabs/omar-docs' ],
    buildDiscarder(logRotator(artifactDaysToKeepStr: '', artifactNumToKeepStr: '3', daysToKeepStr: '', numToKeepStr: '20')),
    disableConcurrentBuilds()
])

node( "${ BUILD_NODE }" ) {
    stage( "Checkout branch $BRANCH_NAME" ) {
        checkout( scm )
    }

    stage( "Load Variables" ) {
        withCredentials([ string( credentialsId: 'o2-artifact-project', variable: 'o2ArtifactProject' ) ]) {
            step ([
                $class: "CopyArtifact",
                projectName: o2ArtifactProject,
                filter: "common-variables.groovy",
                flatten: true
            ])
        }

        load "common-variables.groovy"
    }

    stage ( "Assemble" ) {
        withCredentials([[
            $class: 'UsernamePasswordMultiBinding',
            credentialsId: 'openshiftCredentials',
            usernameVariable: 'OPENSHIFT_USERNAME',
            passwordVariable: 'OPENSHIFT_PASSWORD'
        ]]) {
            sh """
                oc login $OPENSHIFT_URL -u $OPENSHIFT_USERNAME -p $OPENSHIFT_PASSWORD
                python3 createFiles.py
                tar cfz docs.tgz site
            """
        }
        archiveArtifacts "docs.tgz"
    }

    stage ("Publish Docker App") {
        withCredentials([[
            $class: 'UsernamePasswordMultiBinding',
            credentialsId: 'dockerCredentials',
            usernameVariable: 'DOCKER_REGISTRY_USERNAME',
            passwordVariable: 'DOCKER_REGISTRY_PASSWORD'
        ]]) {
            sh """
                mv docs.tgz ./docker
                gradle pushDockerImage -PossimMavenProxy=${MAVEN_DOWNLOAD_URL}
            """
        }
    }

    try {
        stage ( "OpenShift Tag Image" ) {
            withCredentials([[
                $class: 'UsernamePasswordMultiBinding',
                credentialsId: 'openshiftCredentials',
                usernameVariable: 'OPENSHIFT_USERNAME',
                passwordVariable: 'OPENSHIFT_PASSWORD'
            ]]) {
                sh """
                    gradle openshiftTagImage -PossimMavenProxy=${MAVEN_DOWNLOAD_URL}
                """
            }
        }
    } catch ( e ) {
        echo e.toString()
    }

    stage( "Clean Workspace" ) {
        if ( "${ CLEAN_WORKSPACE }" == "true" )
            step([ $class: 'WsCleanup' ])
    }
}
