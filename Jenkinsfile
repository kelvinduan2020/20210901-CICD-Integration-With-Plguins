node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/kelvinduan2020/20210901-my-app'
    }
    stage('Comple-Package') {
        sh 'mvn clean package'
    }
    withEnv(['NEXUS_VERSION = "nexus3"', 
             'NEXUS_PROTOCOL = "http"', 
             'NEXUS_URL = "192.168.99.77:8081"', 
             'NEXUS_RELEASE_REPOSITORY = "my-app-release"', 
             'NEXUS_SNAPSHOT_REPOSITORY = "my-app-snapshot"', 
             'NEXUS_CREDENTIAL_ID = "nexus"',
             'ARTIFACT_ID = "myweb"',
             'GROUP_ID = "in.javahome"']) {
        stage("Upload to Nexus") {
            script {
                def mavenPom = readMavenPom file: 'pom.xml' 
                //def nexusRepoName = mavenPom.version.endsWith("SNAPSHOT") ? ${NEXUS_SNAPSHOT_REPOSITORY} : ${NEXUS_RELEASE_REPOSITORY}
                nexusArtifactUploader artifacts: [
                    [artifactId: "${ARTIFACT_ID}", 
                     classifier: '', 
                     file: "target/${ARTIFACT_ID}-${mavenPom.version}.war", 
                     type: 'war']], 
                    credentialsId: "${NEXUS_CREDENTIAL_ID}", 
                    groupId: "${GROUP_ID}", 
                    nexusUrl: "${NEXUS_URL}", 
                    nexusVersion: "${NEXUS_VERSION}", 
                    protocol: "${NEXUS_PROTOCOL}", 
                    repository: "${NEXUS_RELEASE_REPOSITORY}", 
                    version: "${mavenPom.version}"
            }
        }
    }
}
