import yaml
import os
import subprocess
import json

def createDeployConfigs():
    if not os.path.exists("deployment_configs"):
        os.mkdir("deployment_configs")

    token = subprocess.getoutput("oc whoami -t")
    getConfigsCmd = "curl -H 'Authorization: Bearer {}' -k -L -o deployment_configs/deploymentConfigs.json {}/oapi/v1/namespaces/omar-dev/deploymentconfigs".format(token, os.environ["OPENSHIFT_URL"])
    os.system(getConfigsCmd)

    convertJsontoYaml("deployment_configs/deploymentConfigs.json")

def checkoutRepos(docVars):
    os.chdir("docs")

    for repo in docVars["repos"]:
        cloneCommand = "git clone --depth=1 {}".format(repo)
        os.system(cloneCommand)

    os.chdir("..")

def createCustomPaths(docVars):
    os.chdir("docs")
    customPaths = dict()

    for app in docVars["apps"]:
        docsConfigFile = app + "/docsConfig.yml"
        if os.path.exists(docsConfigFile):
            customPaths[app] = yaml.load(open(docsConfigFile, 'r'), Loader=yaml.FullLoader)
    
    os.chdir("..")
    return customPaths

def homePage(docVars, customPaths):
    os.chdir("docs")

    indexFile = open("index.md", 'a')
    indexFile.write("| | | | | |\n|-|-|-|-|-|\n")
    
    for app in docVars["apps"]:
        indexFile.write("| **{}** | ".format(app))

        for guideName in docVars["guides"]:
            indexFile.write("| ")

            guidePath = getGuidePath(app, customPaths, guideName)
            
            if os.path.exists(guidePath):
                LINK = guidePath.split(".")[0]
                print("Found {}...".format(guidePath))
                indexFile.write("[{}]({}/)".format(guideName, LINK))
        
        indexFile.write("|  |\n")
        README_PATH = app + "/README.md"

        if os.path.exists(README_PATH):
            appDescription = findDescriptionLine(README_PATH)
            if appDescription:
                indexFile.write("| " + appDescription + " |\n")
            else:
                print("Description not found in README.")
                indexFile.write("| Description not available. |\n")
        else:
            indexFile.write("| Description not available. |\n")

    indexFile.close()
    os.chdir("..")

def applicationFiles(docVars, customPaths):
    os.chdir("docs")

    for app in docVars["apps"]:
        if app == "o2-pushbutton":
            continue

        if app in customPaths and "applicationFile" in customPaths[app]:
            CONFIG_FILE = "{}/{}".format(app, str(customPaths[app]["applicationFile"]))
        else:
            CONFIG_FILE = subprocess.getoutput("find {} -name 'application.yml' | head -1".format(app))

        guidePath = getGuidePath(app, customPaths, "install-guide")

        if os.path.exists(guidePath) and os.path.exists(CONFIG_FILE):
            writeFileToGuide(guidePath, CONFIG_FILE, "\n\n## Application YML Configuration\n")

    os.chdir("..")

def deploymentConfig(docVars, customPaths):
    os.chdir("docs")

    for app in docVars["apps"]:

        if app == "omar-base" or app == "omar-config-server" or app == "omar-volume-cleanup":
            continue

        guidePath = getGuidePath(app, customPaths, "install-guide")

        all_configs = os.listdir("../deployment_configs")

        for config in all_configs:
            if app in config:
                CONFIG_PATH = "../deployment_configs/" + config
                if os.path.exists(guidePath) and os.path.exists(CONFIG_PATH):
                    writeFileToGuide(guidePath, CONFIG_PATH, "\n## Example OpenShift Deployment Config\n")

    os.chdir("..")

def dockerFiles(docVars, customPaths):
    os.chdir("docs")

    for app in docVars["apps"]:

        if app in customPaths and "dockerFile" in customPaths[app]:
            DOCKERFILE = "{}/{}".format(app, str(customPaths[app]["dockerFile"]))
        elif os.path.exists(app + "/docker/Dockerfile"):
            DOCKERFILE = "{}/docker/Dockerfile".format(app)
        else:
            DOCKERFILE = "{}/Dockerfile".format(app)

        guidePath = getGuidePath(app, customPaths, "install-guide")

        if os.path.exists(guidePath) and os.path.exists(DOCKERFILE):
            writeFileToGuide(guidePath, DOCKERFILE, "\n## Dockerfile\n")

    os.chdir("..")

def sourceCode(docVars, customPaths):
    os.chdir("docs")

    for app in docVars["apps"]:

        guidePath = getGuidePath(app, customPaths, "install-guide")

        if os.path.exists(guidePath):
            guideStream = open(guidePath, 'a')
            guideStream.write("\n## Source Code\n")
            gitUrl = "https://github.com/ossimlabs/{}.git".format(app)
            guideStream.write("[{0}]({0})\n".format(gitUrl))

    os.chdir("..")

def mkdocsYML(docVars, customPaths):
    mkdocsFile = open("mkdocs.yml", "w+")
    mkdocsFile.write("site_name: O2 Web Services\nextra_javascript:\n- table.js\npages:\n- Home: index.md\n")
    
    for guideName in docVars["guides"]:
        FLAG = False

        for app in docVars["apps"]:
            guidePath = getGuidePath(app, customPaths, guideName)

            if os.path.exists("docs/" + guidePath):
                if not FLAG:
                    mkdocsFile.write("- {}:\n".format(guideName))
                    FLAG = True
                mkdocsFile.write("  - {}: {}\n".format(app, guidePath))
    mkdocsFile.close()

def buildMkdocs():
    os.system("find . -name '*.css' -type f -delete")
    os.system("find . ! -name 'table.js' -name '*.js' -type f -delete")
    os.system("mkdocs build")

def addRepoNames(docVars):
    docVars["repos"] = list()
    GIT_PUBLIC_SERVER_URL = os.environ["GIT_PUBLIC_SERVER_URL"]

    for app in docVars["apps"]:
        docVars["repos"].append("{}/{}.git".format(GIT_PUBLIC_SERVER_URL, app))

def findDescriptionLine(README_PATH):
    README = open(README_PATH, 'r')
    CHECK_NEXT = False

    for line in README:
        if not line.strip():
            continue

        if "## Description" in line:
            CHECK_NEXT = True
            continue

        if CHECK_NEXT:
            return line.strip()

    return None

def getGuidePath(app, customPaths, guideName):
    if app in customPaths and guideName in customPaths[app]:
        guidePath = "{}/{}".format(app, str(customPaths[app][guideName]))
    else:
        guidePath = "{0}/docs/{1}/{0}.md".format(app, guideName)

    return guidePath

def writeFileToGuide(guidePath, filetoWrite, header):
    print("Writing {} to {}".format(filetoWrite, guidePath))

    guideFile = open(guidePath, 'a')
    guideFile.write(header + "```\n")

    for line in open(filetoWrite, 'r'):
        guideFile.write(line)

    guideFile.write("```\n")
    guideFile.close()

def convertJsontoYaml(jsonFile):
    jsonIn = json.load(open(jsonFile, 'r'))

    for config in jsonIn["items"]:
        newConfig = { "apiVersion": jsonIn["apiVersion"], "kind": jsonIn["kind"] }
        newConfig.update(config)

        yamlOut = yaml.dump(newConfig)

        open("deployment_configs/{}.yml".format(config["metadata"]["name"]), "w+").write(yamlOut)

def main():
    # Create OpenShift DeployConfig Files
    createDeployConfigs()

    # Load variables and clone all repos
    docVars = yaml.load(open("docVars.yml", 'r'), Loader=yaml.FullLoader)
    addRepoNames(docVars)
    checkoutRepos(docVars)

    # Create any custom paths for app config files that don't follow the defaults
    customPaths = createCustomPaths(docVars)

    # Create all mkdocs documents
    homePage(docVars, customPaths)
    applicationFiles(docVars, customPaths)
    deploymentConfig(docVars, customPaths)
    dockerFiles(docVars, customPaths)
    sourceCode(docVars, customPaths)
    mkdocsYML(docVars, customPaths)

    # Build the mkdocs site
    buildMkdocs()

if __name__ == "__main__":
    main()
