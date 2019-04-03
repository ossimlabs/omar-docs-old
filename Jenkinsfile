properties([
    parameters ([
        string( name: 'BUILD_NODE', defaultValue: 'omar-build', description: 'The build node to run on' ),
        booleanParam( name: 'CLEAN_WORKSPACE', defaultValue: true, description: 'Clean the workspace at the end of the run' )
    ]),
    pipelineTriggers([
            [ $class: "GitHubPushTrigger" ]
    ]),
    [ $class: 'GithubProjectProperty', displayName: '', projectUrlStr: 'https://github.com/ossimlabs/tlv' ],
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
        sh """
            ./mkdocs.sh
            tar cfz docs.tgz site
        """
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
                gradle pushDockerImage -PossimMavenProxy=https://nexus.ossim.io/nexus/content/repositories/all-repos/    
                #gradle pushDockerImage -PossimMavenProxy=${OSSIM_MAVEN_PROXY}
            """
        }
    }
}