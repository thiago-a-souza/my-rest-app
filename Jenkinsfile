def label = "worker-${UUID.randomUUID().toString()}"

podTemplate(label: label, containers: [
containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: 'cat'),
  containerTemplate(name: 'docker', image: 'docker', command: 'cat', ttyEnabled: true),
  containerTemplate(name: 'kubectl', image: 'lachlanevenson/k8s-kubectl:v1.8.8', command: 'cat', ttyEnabled: true)
],
volumes: [
  hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock'),
  persistentVolumeClaim(mountPath: '/root/.m2/repository', claimName: 'my-pvc', readOnly: false)
]) {
  node(label) {

    stage('compile'){
        container('maven') {
            sh 'mvn package'
        }

    }
  }
}
