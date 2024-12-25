# flutter_task

A new Flutter project.

## Getting Started

Please use these command in command line to get started:

1. `dart pub global activate fvm` -> to install fvm to your main flutter installation, make sure fvm command can be run from command line after doing this, if not, add Pub/Cache/bin (not sure where, depends on OS and installation) to PATH env
2. `fvm install` -> to install correct flutter version for this project
3. `fvm dart pub global activate melos` -> to install melos in system, make sure melos command can be run from command line after doing this, should be done if fvm (step 1 & 2) already setup properly
4. `melos bootstrap` -> to run flutter pub get for all available packages
5. `melos build_runner` and then select * or press enter -> to
   run `fvm flutter pub run build_runner` build for all available packages
6. copy `.env.example` in root project to `.env` in root project, edit according to development
   environment
7. `melos env` -> generate .env dart code based on .env files


### IDE Setup
For more complete guide or extra features, see this link: https://fvm.app/docs/getting_started/configuration/#ide 

#### VSCode
- open or create settings.json in .vscode directory
- make sure to add these to the json config:
```json
{
    "dart.flutterSdkPath": ".fvm/flutter_sdk",
    // Remove .fvm files from search
    "search.exclude": {
        "**/.fvm": true
    },
    // Remove from file watching
    "files.watcherExclude": {
        "**/.fvm": true
    }
}
```

#### Android Studio
- Every time you open the project, make sure you change “Flutter SDK” path to <RootProject>/.fvm/flutter_sdk
- see link above to exclude .fvm/flutter_sdk from being scanned by IDE


## FAQ
- Q: can't run, why?\
  A:
    - check `melos bootstrap`, is it success? should have `- xx package bootstrapped` at the end of script execution, if there is none, check script execution output, there should be some errors, see other FAQ for the resolution
    - check `fvm flutter --version`, it should contains same version as flutterSdkVersion inside `.fvm/fvm_config.json`. if not same, retry `fvm install`, if still same, remove fvm cache, use `fvm list` to get its cache directory
    - Compile error, check below for available FAQ
- Q: Melos bootstrap error, `blablabla is not recognized as an internal or external command` , or `no such file or directory`, why?\
  A: Melos doesn't support directory with space
