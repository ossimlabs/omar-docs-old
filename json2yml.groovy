@Grab("org.yaml:snakeyaml:1.16")
import org.yaml.snakeyaml.Yaml
import groovy.json.JsonSlurper


def text = new File( "deployment_configs/deploymentConfigs.json" ).getText()
def json = new JsonSlurper().parseText( text )

json.items.each {
    def map = [
        apiVersion: json.apiVersion,
        kind: json.kind
    ]

    map << it

    def yaml = new Yaml().dump( map )

    new File( "deployment_configs/${ it.metadata.name }.yml" ).write( yaml )
}
