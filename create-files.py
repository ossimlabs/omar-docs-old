import yaml
import os
import subprocess

def createCustomPaths(docVars):
    os.chdir("docs")
    customPaths = dict()

    for app in docVars["apps"]:
        docsConfigFile = app + "/docsConfig.yml"
        if os.path.exists(docsConfigFile):
            customPaths[app] = yaml.load(open(docsConfigFile, 'r'), Loader=yaml.FullLoader)
    
    os.chdir("..")
    return customPaths

def checkoutRepos(docVars):
    os.chdir("docs")

    for repo in docVars["repos"]:
        cloneCommand = "git clone --depth=1 {}".format(repo)
        os.system(cloneCommand)

    os.chdir("..")

def homePage(docVars, customPaths):
    os.chdir("docs")

    indexFile = open("index.md", 'a')
    indexFile.write("| | | | | |\n|-|-|-|-|-|\n")
    
    for app in docVars["apps"]:
        indexFile.write("| **{}** | ".format(app))

        for guide in docVars["guides"]:
            indexFile.write("| ")

            GUIDE = getGuideFile(app, customPaths, guide)
            
            if os.path.exists(GUIDE):
                LINK = GUIDE.split(".")[0]
                print("Found {}...".format(GUIDE))
                indexFile.write("[{}]({}/)".format(guide, LINK))
        
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
            CONFIG_FILE = app + "/" + str(customPaths[app]["applicationFile"])
        else:
            CONFIG_FILE = subprocess.getoutput("find {} -name 'application.yml' | head -1".format(app))

        GUIDE = getGuideFile(app, customPaths, "install-guide")

        if os.path.exists(GUIDE) and os.path.exists(CONFIG_FILE):
            writeFileToGuide(GUIDE, CONFIG_FILE, "\n\n## Application YML Configuration\n")

    os.chdir("..")

def deploymentConfig(docVars, customPaths):
    os.chdir("docs")

    for app in docVars["apps"]:

        if app == "omar-base" or app == "omar-config-server" or app == "omar-volume-cleanup":
            continue

        GUIDE = getGuideFile(app, customPaths, "install-guide")

        all_configs = os.listdir("../deployment_configs")

        for config in all_configs:
            if app in config:
                CONFIG_PATH = "../deployment_configs/" + config
                if os.path.exists(GUIDE) and os.path.exists(CONFIG_PATH):
                    writeFileToGuide(GUIDE, CONFIG_PATH, "\n## Example OpenShift Deployment Config\n")

    os.chdir("..")

def dockerFiles(docVars, customPaths):
    os.chdir("docs")

    for app in docVars["apps"]:

        if app in customPaths and "dockerFile" in customPaths[app]:
            DOCKERFILE = app + "/" + str(customPaths[app]["dockerFile"])
        elif os.path.exists(app + "/docker/Dockerfile"):
            DOCKERFILE = app + "/docker/Dockerfile"
        else:
            DOCKERFILE = app + "/Dockerfile"

        GUIDE = getGuideFile(app, customPaths, "install-guide")

        if os.path.exists(GUIDE) and os.path.exists(DOCKERFILE):
            writeFileToGuide(GUIDE, DOCKERFILE, "\n## Dockerfile\n")

    os.chdir("..")

def sourceCode(docVars, customPaths):
    os.chdir("docs")

    for app in docVars["apps"]:

        GUIDE = getGuideFile(app, customPaths, "install-guide")

        if os.path.exists(GUIDE):
            guideStream = open(GUIDE, 'a')
            guideStream.write("\n## Source Code\n")
            gitUrl = "https://github.com/ossimlabs/{}.git".format(app)
            guideStream.write("[{0}]({0})\n".format(gitUrl))

    os.chdir("..")

def mkdocsYML(docVars, customPaths):
    mkdocsFile = open("mkdocs.yml", "w+")
    mkdocsFile.write("site_name: O2 Web Services\nextra_javascript:\n- table.js\npages:\n- Home: index.md\n")
    
    for guide in docVars["guides"]:
        FLAG = False

        for app in docVars["apps"]:
            GUIDE = getGuideFile(app, customPaths, guide)

            if os.path.exists("docs/" + GUIDE):
                if not FLAG:
                    mkdocsFile.write("- {}:\n".format(guide))
                    FLAG = True
                mkdocsFile.write("  - {}: {}\n".format(app, GUIDE))
    mkdocsFile.close()

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

def getGuideFile(app, customPaths, guide):
    if app in customPaths and guide in customPaths[app]:
        GUIDE = app + "/" + str(customPaths[app][guide])
    else:
        GUIDE = app + "/docs/" + guide + "/" + app + ".md"

    return GUIDE

def writeFileToGuide(GUIDE, filetoWrite, header):
    print("Writing {} to {}".format(filetoWrite, GUIDE))

    guideFile = open(GUIDE, 'a')
    guideFile.write(header + "```\n")

    for line in open(filetoWrite, 'r'):
        guideFile.write(line)

    guideFile.write("```\n")
    guideFile.close()

def addRepoNames(docVars):
    docVars["repos"] = list()
    GIT_PUBLIC_SERVER_URL = os.environ["GIT_PUBLIC_SERVER_URL"]

    for app in docVars["apps"]:
        docVars["repos"].append(GIT_PUBLIC_SERVER_URL + "/" + app + ".git")
    
def main():
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

if __name__ == "__main__":
    main()
