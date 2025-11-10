allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    // Only relocate build directories for projects that are inside the root project
    // (skip external/plugin projects that live in the pub cache or other locations).
    if (project.path == ":app") {
        val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
        project.layout.buildDirectory.value(newSubprojectBuildDir)
    }

    project.evaluationDependsOn(":app")
}

// tasks.register<Delete>("clean") {
//     delete(rootProject.layout.buildDirectory)
// }

