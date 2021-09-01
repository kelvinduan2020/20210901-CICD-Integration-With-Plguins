node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/kelvinduan2020/20210901-my-app'
    }
    stage('Comple-Package') {
        sh 'mvn clean package'
    }
    stage('SonarQube Analysis') {
        withSonarQubeEnv(credentialsId: 'sonarqube') {
            sh 'mvn sonar:sonar'
        }
    }
    stage("Quality Gate Status Check"){
        timeout(time: 1, unit: 'HOURS') {
            def qg = waitForQualityGate()
            if (qg.status != 'OK') {
                error "Pipeline aborted due to quality gate failure: ${qg.status}"
            }
        }
    }
//     stage("Upload to Nexus") {
//         script {
//             def mavenPom = readMavenPom file: 'pom.xml' 
//             //def nexusRepoName = mavenPom.version.endsWith("SNAPSHOT") ? ${NEXUS_SNAPSHOT_REPOSITORY} : ${NEXUS_RELEASE_REPOSITORY}
//             nexusArtifactUploader artifacts: [
//                 [artifactId: 'myweb', 
//                  classifier: '', 
//                  file: "target/myweb-${mavenPom.version}.war", 
//                  type: 'war']], 
//                 credentialsId: 'nexus', 
//                 groupId: 'in.javahome', 
//                 nexusUrl: '192.168.99.88:8081', 
//                 nexusVersion: 'nexus3', 
//                 protocol: 'http', 
//                 repository: 'my-app-release', 
//                 version: "${mavenPom.version}"
//         }
//     }
//     stage('Build Docker Image') {
//         sh 'docker build -t kelvinduan/webapp:1.0.0 .'
//     }
//     stage('Push Docker Image to GitHub') {
//         withCredentials([string(credentialsId: 'docker-password', variable: 'dockerPwd')]) {
//             sh "docker login -u kelvinduan -p ${dockerPwd}"
//         }
//         sh 'docker push kelvinduan/webapp:1.0.0'
//     }
//     stage('Run Docker Container on Vagrant App Server') {
//         def dockerRun = 'docker run -p 8080:8080 -d --name myapp kelvinduan/webapp:1.0.0'
//         sshagent(['app-server']) {
//             sh "ssh -o StrictHostKeyChecking=no vagrant@192.168.99.88 ${dockerRun}"
//         }
//     }
}
