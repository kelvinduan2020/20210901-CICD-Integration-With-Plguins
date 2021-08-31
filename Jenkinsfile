node {
    stage('SCM Checkout') {
        git branch: 'main', url: 'https://github.com/kelvinduan2020/20210901-my-app'
    }
    stage('Comple-Package') {
        sh 'mvn package'
    }
}
