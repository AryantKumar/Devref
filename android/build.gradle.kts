allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    val subProject = this
    subProject.afterEvaluate {
        pluginManager.withPlugin("com.android.library") {
            configure<com.android.build.gradle.LibraryExtension> {
                if (namespace.isNullOrEmpty()) {
                    namespace = "dev.isar.${project.name.replace("-", "_")}"
                }
                compileSdk = 34
                compileSdkVersion(34)
            }
        }
    }
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}